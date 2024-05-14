import { corsHeaders } from "../_shared/cors.ts";
import {
  getAccessToken,
  sendNotificationWithData,
} from "../_shared/notification_access.ts";

interface DefaultNotificationPayload {
  notificationType: "send_jam_request_accepted_notification";
  title: string;
}

interface ClientPayload {
  user_fcm_token: string;
}

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  const payload: ClientPayload = await req.json();

  const { default: serviceAccount } = await import(
    "../_shared/service-account.json",
    { with: { type: "json" } }
  );

  const accessToken = await getAccessToken(
    serviceAccount.client_email,
    serviceAccount.private_key,
  );

  await sendNotificationWithData<DefaultNotificationPayload>(
    accessToken,
    payload.user_fcm_token,
    {
      title: `Jam request accepted`,
      notificationType: "send_jam_request_accepted_notification",
    },
  );

  return new Response(
    JSON.stringify({ message: "Notification sent!" }),
    { headers: { "Content-Type": "application/json" } },
  );
});
