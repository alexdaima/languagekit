"use client";

import { useCallback } from "react";
import { ApolloLink, HttpLink } from "@apollo/client";
import {
  ApolloNextAppProvider,
  NextSSRInMemoryCache,
  NextSSRApolloClient,
  SSRMultipartLink,
} from "@apollo/experimental-nextjs-app-support/ssr";

const getBaseUrl = (): string | undefined => {
  if (typeof window !== "undefined") {
    const hostname = window.location.hostname;
    const port = window.location.port;
    switch (hostname) {
      case "languagekit.io":
        return "https://api.languagekit.io";
      case "localhost":
        switch (port) {
          case "3000":
            return "http://localhost:4000";
          case "3001":
            return "http://localhost:4001";
        }
    }
  }
};

function createClient(authorization: string | undefined) {
  const headers: Record<string, string> = {};
  if (authorization !== undefined) {
    headers["Authorization"] = authorization;
  }

  const httpLink = new HttpLink({
    uri: getBaseUrl() + "/graphql",
    headers: headers,
    fetchOptions: { cache: "no-store" },
  });

  return new NextSSRApolloClient({
    cache: new NextSSRInMemoryCache(),
    link:
      typeof window === "undefined"
        ? ApolloLink.from([
            new SSRMultipartLink({
              stripDefer: true,
            }),
            httpLink,
          ])
        : httpLink,
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
}

export function ApolloWrapper({
  children,
  authorization,
}: React.PropsWithChildren<{
  authorization: string | undefined;
}>) {
  const makeClient = useCallback(
    () => createClient(authorization),
    [authorization]
  );
  return (
    <ApolloNextAppProvider makeClient={makeClient}>
      {children}
    </ApolloNextAppProvider>
  );
}
