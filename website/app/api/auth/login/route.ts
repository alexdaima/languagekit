import { LoginDocument } from "./Login.generated";
import { getClient } from "@/ApolloClient";
import { cookies } from "next/headers";

export async function POST(request: Request) {
  const { username, password } = await request.json();
  const { data, errors } = await getClient().mutate({
    mutation: LoginDocument,
    variables: { username: username, password: password },
    fetchPolicy: "no-cache",
    errorPolicy: "all",
  });
  if (data?.login?.token) {
    cookies().set({
      name: "auth",
      value: data?.login?.token,
      httpOnly: true,
      path: "/",
    });
    return Response.json({ success: true, errors: [] });
  } else {
    return Response.json({ success: false, errors: errors });
  }
}
