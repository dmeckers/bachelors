import { createClient } from "https://esm.sh/@supabase/supabase-js@2.5.0";

//TODO - use env variables
export const supabaseClient = await createClient(
  "https://iftwgsudzkdfekfwxmti.supabase.co",
  // Deno.env.get("SUPABASE_ANON_KEY")!,
  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlmdHdnc3VkemtkZmVrZnd4bXRpIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTcwNTgzODQ0NCwiZXhwIjoyMDIxNDE0NDQ0fQ.IHP5pDrmIeVkKGtxYVYBZjyVNXuxPB32Im8LPDaC2b0",
);
