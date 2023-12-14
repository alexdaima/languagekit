import Form from "./Form";
import { cookies } from "next/headers";
import { redirect } from "next/navigation";

export default function Page() {
  const cookieStore = cookies();
  const authCookie = cookieStore.get("auth");
  if (authCookie !== undefined) {
    redirect("/");
  }
  return (
    <main className="flex flex-col justify-center items-center min-h-screen">
      <Form />
    </main>
  );
}
