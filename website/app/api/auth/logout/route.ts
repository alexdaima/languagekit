import { cookies } from "next/headers";

export async function POST(request: Request) {
  cookies().delete("auth");
  return Response.json({});
}
