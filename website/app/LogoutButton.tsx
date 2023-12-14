"use client";

export default function LoginButton() {
  return (
    <button
      className="text-white bg-[#24292F] hover:bg-[#24292F]/90 focus:ring-4 focus:outline-none focus:ring-[#24292F]/50 font-medium rounded-lg text-sm px-5 py-2.5 text-center inline-flex items-center dark:focus:ring-gray-500 dark:hover:bg-[#050708]/30"
      onClick={() => {
        fetch("/api/auth/logout", {
          method: "POST",
          headers: {
            "Content-type": "application/json",
          },
          body: JSON.stringify({}),
        })
          .then((response) => response.json())
          .then((data) => {
            location.reload();
          });
      }}
    >
      Logout
    </button>
  );
}
