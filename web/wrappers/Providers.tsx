"use client";

import { ReactNode } from "react";
import { SessionProvider } from "next-auth/react";

interface props {
  children: ReactNode;
}

const Providers = ({ children }: props) => {
  return <SessionProvider>{children}</SessionProvider>;
};

export default Providers;
