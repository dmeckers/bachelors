export interface WebhookPaylod<T> {
  type: "INSERT" | "UPDATE" | "DELETE";
  table: string;
  record: T;
  schema:
    | "public"
    | "auth"
    | "storage"
    | "realtime"
    | "postgrest"
    | "supabase"
    | "schema";
  old_record: null | T;
}
