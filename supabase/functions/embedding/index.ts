// /// <reference types="https://esm.sh/v135/@supabase/functions-js@2.4.1/src/edge-runtime.d.ts" />

// import { createClient } from "npm:@supabase/supabase-js@2.42.0";
// import { Database, Tables } from "../_shared/database.types.ts";

// type EmbeddingsRecord = Tables<"vibes">;
// interface WebhookPayload {
//   type: "INSERT" | "UPDATE" | "DELETE";
//   table: string;
//   record: EmbeddingsRecord;
//   schema: "public";
//   old_record: null | EmbeddingsRecord;
// }

// const supabase = createClient<Database>(
//   Deno.env.get("SUPABASE_URL")!,
//   Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
// );
// // Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlmdHdnc3VkemtkZmVrZnd4bXRpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDU4Mzg0NDQsImV4cCI6MjAyMTQxNDQ0NH0.PXt4RHtc5Wx3bd59El4RXBRhR48fvwA-BJsWsdyLSpE

// const model = new Supabase.ai.Session("gte-small");

// Deno.serve(async (req) => {
//   const payload: WebhookPayload = await req.json();
//   const { name, id } = payload.record;

//   if (name === payload?.old_record?.name) {
//     return new Response("ok - no change");
//   }

//   const embedding = await model.run(name, {
//     mean_pool: true,
//     normalize: true,
//   });

//   const { error } = await supabase.from("vibes").update({
//     embedding: JSON.stringify(embedding),
//   }).eq(
//     "id",
//     id,
//   );
//   if (error) console.warn(error.message);

//   return new Response("ok - updated");
// });

import {
  env,
  pipeline,
} from "https://cdn.jsdelivr.net/npm/@xenova/transformers@2.5.0";
// import { client } from "./db.ts";
import { corsHeaders } from "../_shared/cors.ts";
import { supabaseClient } from "../_shared/index.ts";
// import { client } from "./db.ts";

env.useBrowserCache = false;
env.allowLocalModels = false;

const pipe = await pipeline(
  "feature-extraction",
  "Supabase/gte-small",
);

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }
  try {
    const { record } = await req.json();
    console.log(record);
    const { name } = record;

    const output = await pipe(name, {
      pooling: "mean",
      normalize: true,
    });

    const embedding = JSON.stringify(Array.from(output.data)).replace(/"/g, "");

    console.log("embedding length", embedding.length);

    // if (!client.connected) {
    //   await client.connect();
    // }

    // await client.queryObject({
    //   text: "UPDATE vibes SET embedding = $1 WHERE id = $2",
    //   args: [embedding, id.trim()],
    // });

    // await supabaseClient.from("vibes").update({ embedding }).eq(
    //   "id",
    //   id.trim(),
    // );

    // await supabaseClient.rpc("update_embedding", {
    //   vector_data: embedding,
    //   record_id: id.trim(),
    // });

    return new Response(JSON.stringify(embedding), {
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (error) {
    console.log("Error happpened while creating embedding.Error:", error);
    return new Response(
      JSON.stringify({ error: error.message }),
      { headers: { "Content-Type": "application/json" } },
    );
  }
});
