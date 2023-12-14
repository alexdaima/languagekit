import { SignupDocument } from "./Signup.generated";
import { getClient } from "@/ApolloClient";
import { cookies } from "next/headers";

export async function POST(request: Request) {
  const { username, password } = await request.json();
  const { data, errors } = await getClient().mutate({
    mutation: SignupDocument,
    variables: { username: username, password: password },
    fetchPolicy: "no-cache",
    errorPolicy: "all",
  });

  if (data?.signup?.token) {
    cookies().set({
      name: "auth",
      value: data?.signup?.token,
      httpOnly: true,
      path: "/",
    });
    return Response.json({ success: true, errors: [] });
  } else {
    return Response.json({ success: false, errors: errors });
  }
}
