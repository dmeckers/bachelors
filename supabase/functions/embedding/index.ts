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
    const { name, description, id } = record;
    const input = description.length
      ? description.replace(/\n/g, " ")
      : name.replace(/\n/g, " ");

    const output = await pipe(input, {
      pooling: "mean",
      normalize: true,
    });

    const embedding = JSON.stringify(Array.from(output.data)).replace(/"/g, "");

    console.log("embedding length", embedding.length);
    console.log("id", id);

    // if (!client.connected) {
    //   await client.connect();
    // }

    // await client.queryObject({
    //   text: "UPDATE vibes SET embedding = $1 WHERE id = $2",
    //   args: [embedding, id.trim()],
    // });

    await supabaseClient.from("vibes").update({ embedding }).eq(
      "id",
      id.trim(),
    );

    // await supabaseClient.rpc("update_embedding", {
    //   vector_data: embedding,
    //   record_id: id.trim(),
    // });

    return new Response("ok", {
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
