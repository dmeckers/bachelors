// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import { ClientOptions, OpenAI } from "https://esm.sh/openai@4.31.0";

console.log("Hello from Functions!");

const config: ClientOptions = {
  apiKey: "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",
};
const openAi = new OpenAI(config);

Deno.serve(async (req) => {
  const { record: { name } } = await req.json();

  const input = name.replace(/\n/g, " ");

  const responseFromOpenAi = await openAi.completions.create({
    model: "gpt-3.5-turbo-instruct",
    prompt: `Tell me what is ${input} about? (The term , not something else)`,
    max_tokens: 200,
    temperature: 0.5,
  });

  const { id: completionId, choices: [{ text }] } = responseFromOpenAi;

  const description = removeLastSentenceIfNoPeriod(text.replace(/\n/g, " "));

  // console.log("description", description);

  return new Response(
    JSON.stringify({
      id: completionId,
      description,
      vibeName: name,
    }),
    { headers: { "Content-Type": "application/json" } },
  );
});

function removeLastSentenceIfNoPeriod(text: string) {
  const sentences = text.split(". ");

  if (!sentences[sentences.length - 1].endsWith(".")) {
    sentences.pop();
  }

  return sentences.join(". ");
}

/* To invoke locally:

  1. Run `supabase start` (see: https://supabase.com/docs/reference/cli/supabase-start)
  2. Make an HTTP request:

  curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/openai_vibe_description' \
    --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
    --header 'Content-Type: application/json' \
    --data '{"name":"Functions"}'

*/
