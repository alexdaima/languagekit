"use client";

import { useRouter } from "next/navigation";
import { useLazyQuery } from "@apollo/client";
import { HelloWorldDocument } from "./HelloWorld.generated";
import { toast } from "react-toastify";

export default function HelloWorldButton() {
  const [helloWorld, _ops] = useLazyQuery(HelloWorldDocument, {
    onError: (error) => {
      toast.error(error.message);
    },
    onCompleted: (response) => {
      toast.success(response.helloWorld);
    },
  });

  const router = useRouter();
  return (
    <button
      className="text-white bg-[#24292F] hover:bg-[#24292F]/90 focus:ring-4 focus:outline-none focus:ring-[#24292F]/50 font-medium rounded-lg text-sm px-5 py-2.5 text-center inline-flex items-center dark:focus:ring-gray-500 dark:hover:bg-[#050708]/30"
      onClick={() => {
        helloWorld();
      }}
    >
      Hello World
    </button>
  );
}
