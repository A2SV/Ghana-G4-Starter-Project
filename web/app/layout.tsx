"use client";
import { Inter } from "next/font/google";
import "./globals.css";
import { PublicEnvScript } from "next-runtime-env";

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
      <body className={inter.className}>
        {children}
      </body>
    </html>
  );
}
