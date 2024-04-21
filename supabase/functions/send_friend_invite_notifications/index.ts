import { corsHeaders } from "../_shared/cors.ts";
import {
  getAccessToken,
  sendNotificationWithData,
} from "../_shared/notification_access.ts";

interface FriendInvite {
  id: number;
  user_sent: string;
  user_received: string;
  inserted_at: string;
}

interface FriendInviteNotificationPayload {
  title: string;
  body: string;
  notificationType: "friend_invite";
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

  await sendNotificationWithData<FriendInviteNotificationPayload>(
    accessToken,
    payload.user_fcm_token,
    {
      title: "Friend Invite",
      body: "You have a new friend invite!",
      notificationType: "friend_invite",
    },
  );

  return new Response(
    JSON.stringify({ message: "Notification sent!" }),
    { headers: { "Content-Type": "application/json" } },
  );
});

/* To invoke locally:

  1. Run `supabase start` (see: https://supabase.com/docs/reference/cli/supabase-start)
  2. Make an HTTP request:

  curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/friend_invite_notification' \
    --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
    --header 'Content-Type: application/json' \
    --data '{"name":"Functions"}'

*/
