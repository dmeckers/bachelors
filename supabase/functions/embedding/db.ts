import * as postgres from "https://deno.land/x/postgres@v0.17.0/mod.ts";

const pass = "8A9TFQ9^p{\\xU603do9o&}(~uA^x6L";
// const user = "postgres";
// const awsRegion = "us-cental-1";
// const port = 6543;
// const projectRef = "agqrvkyumsxsglzdwjdw";
// const dbName = "postgres";

// const connectionString = 'postgres://[db-user]:[db-password]@[db-password]@aws-0-[aws-region].pooler.supabase.com:6543/[db-name]?options=reference%3D[project-ref]'
// const connectionString =
//   `postgres://${user}:${pass}@${pass}@aws-0-${awsRegion}.pooler.supabase.com:${port}/${dbName}?options=reference%3D${projectRef}`;

const connectionString =
  `postgres://postgres.agqrvkyumsxsglzdwjdw:${pass}@aws-0-eu-central-1.pooler.supabase.com:6543/postgres`;

export const client = new postgres.Client(connectionString);
