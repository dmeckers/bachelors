import { corsHeaders } from "../_shared/cors.ts";
import {
  getAccessToken,
  sendNotificationWithData,
} from "../_shared/notification_access.ts";

interface FormSubmittedNotificationPayload {
  notificationType: "jam_form_submitted";
  title: string;
  body: string;
}

interface ClientPayload {
  creator_fcm_token: string;
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
      title: "New jam join request!",
      body: "Somebody wants to join your jam!",
      notificationType: "jam_form_submitted",
    },
  );

  return new Response(
    JSON.stringify({ message: "Notification sent!" }),
    { headers: { "Content-Type": "application/json" } },
  );
});
