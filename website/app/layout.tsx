import type { Metadata } from "next";
import { cookies } from "next/headers";
import { Inter } from "next/font/google";
import "./globals.css";
import { ApolloWrapper } from "./ApolloWrapper";
import Toaster from "./Toaster";
import "react-toastify/dist/ReactToastify.css";

const inter = Inter({ subsets: ["latin"] });

export const metadata: Metadata = {
  title: "LanguageKit",
  description: "",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const cookieStore = cookies();
  return (
    <html lang="en">
      <body className={inter.className}>
        <ApolloWrapper authorization={cookieStore.get("auth")?.value}>
          {children}
          <Toaster />
        </ApolloWrapper>
      </body>
    </html>
  );
}
