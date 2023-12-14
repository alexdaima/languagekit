import { redirect } from "next/navigation";
import Form from "./Form";
import { cookies } from "next/headers";

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
