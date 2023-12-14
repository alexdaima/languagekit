import { cookies } from "next/headers";
import LoginButton from "./LoginButton";
import SignupButton from "./SignupButton";
import LogoutButton from "./LogoutButton";
import HelloWorldButton from "./HelloWorld";

export default function Page() {
  const cookieStore = cookies();
  const authCookie = cookieStore.get("auth");
  if (authCookie === undefined) {
    return (
      <main className="flex flex-col justify-center items-center min-h-screen">
        <h1 className="mb-16">LanguageKit</h1>
        <div className="flex flex-col gap-2">
          <LoginButton />
          <SignupButton />
          <HelloWorldButton />
        </div>
      </main>
    );
  }
  return (
    <main className="flex flex-col justify-center items-center min-h-screen">
      <h1 className="mb-16">LanguageKit</h1>
      <div className="flex flex-col gap-2">
        <LogoutButton />
        <HelloWorldButton />
      </div>
    </main>
  );
}
