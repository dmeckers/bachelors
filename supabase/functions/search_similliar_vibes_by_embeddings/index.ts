import {
  env,
  pipeline,
} from "https://cdn.jsdelivr.net/npm/@xenova/transformers@2.5.0";
import { corsHeaders } from "../_shared/index.ts";

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
    const { query } = await req.json();

    const input = query.replace(/\n/g, " ");

    const output = await pipe(input, {
      pooling: "mean",
      normalize: true,
    });

    return new Response(
      JSON.stringify(JSON.stringify(Array.from(output.data)).replace(/"/g, "")),
      {
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      },
    );
  } catch (error) {
    return new Response(
      JSON.stringify(error),
      {
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      },
    );
  }
});
