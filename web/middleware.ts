import { NextResponse } from "next/server";
import type { NextRequest } from "next/server";
import { getToken } from "next-auth/jwt";
import createMiddleware from "next-intl/middleware";
import { env } from "next-runtime-env";

export const middleware = async (req: NextRequest): Promise<NextResponse> => {
  const { pathname } = req.nextUrl;

  const session = await getToken({ req, secret: env("NEXTAUTH_SECRET") });

  const url = req.nextUrl.clone();

  if (pathname === "/login" || pathname === "/signup") {
    if (session) {
      url.pathname = "/blog";
      return NextResponse.redirect(url);
    }
  }

  if (pathname.startsWith("/profile")) {
    if (!session) {
      url.pathname = "/login";
      return NextResponse.redirect(url);
    }
  }

  if (pathname.startsWith("/blog")) {
    if (!session) {
      url.pathname = "/login";
      return NextResponse.redirect(url);
    }
  }

  return NextResponse.next();
};

export const config = {
  matcher: ["/login", "/signup", "/profile/:path*", "/blog/:path*"],
};

export default createMiddleware({
  locales: ["en", "am"],
  defaultLocale: "en",
});
