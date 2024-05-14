import { corsHeaders } from "../_shared/cors.ts";
import {
  getAccessToken,
  sendNotificationWithData,
} from "../_shared/notification_access.ts";

interface FormSubmittedNotificationPayload {
  notificationType: "send_jam_form_submitted_joined_notification";
  title: string;
  body: string;
}

interface ClientPayload {
  creator_fcm_token: string;
  joined_user_name: string;
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

  await sendNotificationWithData<FormSubmittedNotificationPayload>(
    accessToken,
    payload.creator_fcm_token,
    {
      title: `${payload.joined_user_name} is joining to your jam!`,
      body:
        `${payload.joined_user_name} has filled form and now is part of your jam!`,
      notificationType: "send_jam_form_submitted_joined_notification",
    },
  );

  return new Response(
    JSON.stringify({ message: "Notification sent!" }),
    { headers: { "Content-Type": "application/json" } },
  );
});
