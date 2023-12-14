import { ApolloClient, HttpLink, InMemoryCache } from "@apollo/client";
import { registerApolloClient } from "@apollo/experimental-nextjs-app-support/rsc";
import { cookies } from "next/headers";

export const { getClient } = registerApolloClient(() => {
  const cookieStore = cookies();
  const headers: Record<string, string> = {};
  const authCookie = cookieStore.get("auth");
  if (authCookie) {
    headers["Authorization"] = authCookie.value;
  }
  return new ApolloClient({
    cache: new InMemoryCache({
      dataIdFromObject: () => undefined,
    }),
    link: new HttpLink({
      uri: process.env.API_URL,
      headers: headers,
      credentials: "include",
      fetchOptions: { cache: "no-store" },
    }),
    defaultOptions: {
      watchQuery: {
        fetchPolicy: "no-cache",
        errorPolicy: "ignore",
      },
      query: {
        fetchPolicy: "no-cache",
        errorPolicy: "all",
      },
    },
  });
});
