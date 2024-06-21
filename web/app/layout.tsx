"use client";
import { Inter } from "next/font/google";
import "./globals.css";
import { PublicEnvScript } from "next-runtime-env";
import { store } from "@/redux/store";
import { Provider } from "react-redux";

const inter = Inter({ subsets: ["latin"] });

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>): JSX.Element {
  return (
    <html lang="en">
      <head>
        <PublicEnvScript />
      </head>
      <Provider store={store}>
        <body className={inter.className}>{children}</body>
      </Provider>
    </html>
  );
}
