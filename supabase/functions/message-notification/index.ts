import { supabaseClient } from "../_shared/client.ts";
import type { WebhookPaylod } from "../_shared/interfaces.ts";
import { getAccessToken, sendNotification } from "./notification.ts";

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

Deno.serve(async (req) => {
  const payload: WebhookPaylod<Message> = await req.json();

  // console.log("Received payload:", payload.record);

  const users = await supabaseClient.from("users_chats").select(
    "*, profiles!user_id(id , fcm_token , full_name , avatar)",
  ).eq("chat_id", payload.record.chat_id);

  // console.log("Users in chat:", users.data);

  const { default: serviceAccount } = await import(
    "../_shared/service-account.json",
    { with: { type: "json" } }
  );

  const accessToken = await getAccessToken(
    serviceAccount.client_email,
    serviceAccount.private_key,
  );

  const sender = users.data?.find((u: ProfileResponse) =>
    u.profiles.id === payload.record.sender_id
  );
  // console.log("Sender:", sender);

  const { full_name: senderName, id: senderId, avatar } = sender?.profiles!;

  if (users.data != null && users.data.length > 0) {
    for (const { profiles: { id, fcm_token } } of users.data) {
      if (id === payload.record.sender_id) continue;
      const title = `New Message from ${senderName}`;
      const body = payload.record.message_type === "text"
        ? payload.record.message_text
        : payload.record.message_type;
      await sendNotification(
        accessToken,
        fcm_token,
        title,
        body!,
        senderId,
        payload.record.message_type,
        payload.record.chat_id.toString(),
        avatar,
      );
    }
  }

  return new Response("OK");
});
