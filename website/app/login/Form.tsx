"use client";
import { useState } from "react";
import { toast } from "react-toastify";

export default function Form() {
  const [username, setUsername] = useState<string>("");
  const [password, setPassword] = useState<string>("password");

  return (
    <div className="flex flex-col gap-4">
      <input
        value={username}
        onChange={(event) => setUsername(event.target.value)}
        className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        placeholder="Username"
      ></input>
      <input
        value={password}
        onChange={(event) => setPassword(event.target.value)}
        className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        placeholder="Password"
        type="password"
      ></input>
      <button
        className="text-white bg-[#24292F] hover:bg-[#24292F]/90 focus:ring-4 focus:outline-none focus:ring-[#24292F]/50 font-medium rounded-lg text-sm px-5 py-2.5 text-center inline-flex items-center self-center dark:focus:ring-gray-500 dark:hover:bg-[#050708]/30"
        onClick={() =>
          fetch("/api/auth/login", {
            method: "POST",
            headers: {
              "Content-type": "application/json",
            },
            body: JSON.stringify({
              username: username,
              password: password,
            }),
          })
            .then((response) => response.json())
            .then((data) => {
              const { success, errors } = data;
              if (success === true) {
                location.reload();
              } else {
                errors.forEach((error: any) => {
                  toast.error(error.message);
                });
              }
            })
        }
      >
        Login
      </button>
    </div>
  );
}
