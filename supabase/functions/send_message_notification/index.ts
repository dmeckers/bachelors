import {
  getAccessToken,
  sendNotification,
} from "../_shared/notification_access.ts";

interface Message {
  id: number;
  chat_id: number;
  sent_at: Date;
  edited_at: Date | null;
  sender_id: string;
  replied_to: number | null;
  message_text: string | null;
  message_type: string;
  media_content: string | null;
}

interface ProfileResponse {
  user_id: string;
  chat_id: number;
  to_hide: boolean;
  created_at: string;
  profiles: {
    id: string;
    fcm_token: string;
    full_name: string;
  };
}

interface ClientPayload {
  fcm_token: string;
  message: string;
  chat_id: number;
  sender_id: string;
  avatar: string;
  message_type: string;
  sender_name: string;
}

Deno.serve(async (req) => {
  const payload: ClientPayload = await req.json();

  const { default: serviceAccount } = await import(
    "../_shared/service-account.json",
    { with: { type: "json" } }
  );

  const accessToken = await getAccessToken(
    serviceAccount.client_email,
    serviceAccount.private_key,
  );

  const title = `New Message from ${payload.sender_name}`;

  const body = payload.message_type === "text"
    ? payload.message
    : payload.message_type;

  await sendNotification(
    accessToken,
    payload.fcm_token,
    title,
    body,
    payload.sender_id,
    payload.message_type,
    payload.chat_id.toString(),
    payload.avatar,
    "message_notification",
  );

  return new Response("OK");
});
