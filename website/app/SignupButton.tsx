"use client";

import { useRouter } from "next/navigation";

export default function SignupButton() {
  const router = useRouter();
  return (
    <button
      className="text-stone-700"
      onClick={() => {
        router.push("/signup");
      }}
    >
      or sign up
    </button>
  );
}
