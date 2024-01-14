import { create } from "https://deno.land/x/djwt@v3.0.1/mod.ts";

export async function sendNotification(
  accessToken: string,
  fcmToken: string,
  title: string,
  body: string,
  senderId: string,
  messageType: string,
  chatId: string,
  avatar: string,
) {
  const response = await fetch(
    "https://fcm.googleapis.com/v1/projects/jamm-10753/messages:send",
    {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `Bearer ${accessToken}`,
      },
      body: JSON.stringify({
        message: {
          token: fcmToken,
          data: {
            title,
            body,
            senderId,
            messageType,
            chatId,
            avatar,
          },
        },
      }),
    },
  );

  if (!response.ok) {
    const data = await response.json();
    console.error("Failed to send notification:", data);
    throw new Error("Failed to send notification");
  }
}

export async function getAccessToken(
  clientEmail: string,
  privateKey: string,
): Promise<string> {
  const iat = Math.floor(Date.now() / 1000);
  const exp = iat + 3600; // Token valid for one hour

  const payload = {
    iss: clientEmail,
    scope: "https://www.googleapis.com/auth/firebase.messaging",
    aud: "https://oauth2.googleapis.com/token",
    exp: exp,
    iat: iat,
  };

  const header = {
    alg: "RS256" as const,
    typ: "JWT",
  };

  // Convert the private key string into a CryptoKey object
  const pem = privateKey
    .replace(/\\n/g, "\n")
    .replace("-----BEGIN PRIVATE KEY-----", "")
    .replace("-----END PRIVATE KEY-----", "");
  const binary = atob(pem);
  const array = new Uint8Array(binary.length);
  for (let i = 0; i < binary.length; i++) {
    array[i] = binary.charCodeAt(i);
  }
  const key = await crypto.subtle.importKey(
    "pkcs8",
    array,
    {
      name: "RSASSA-PKCS1-v1_5",
      hash: "SHA-256",
    },
    false,
    ["sign"],
  );

  const jwt = await create(header, payload, key);
  const response = await fetch("https://oauth2.googleapis.com/token", {
    method: "POST",
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    },
    body:
      `grant_type=urn:ietf:params:oauth:grant-type:jwt-bearer&assertion=${jwt}`,
  });

  const data = await response.json();
  return data.access_token;
}
