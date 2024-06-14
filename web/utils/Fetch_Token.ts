// utils/fetchWithToken.js
// import { fetchBaseQuery } from "@reduxjs/toolkit/query/react";
// import { getSession } from "next-auth/react";
// import { env } from "next-runtime-env";

// const fetchWithToken = async (args: any, api: any, extraOptions: any) => {
//   const session = await getSession();
//   session?.user?.token;
//   const token =
//     "eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTUxMiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiTWlraSBUYW1lIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoibWlraUBnbWFpbC5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9zaWQiOiIxIiwiZXhwIjoxNzE4NTY5OTA4fQ.KFC9hs79J388EWxt4XM2jakmjMfIXIuV1XlyClsyL8IAQWweSHbvl6TxHPcjBNVtq2804mmDLR_p6NHDJObOoQ";

//   let headers: any = {};
//   if (token) {
//     headers["Authorization"] = `Bearer ${token}`;
//   }

//   return fetchBaseQuery({
//     baseUrl: env("NEXT_PUBLIC_BASE_URL"),
//     prepareHeaders: (headers, { getState }) => {
//       if (token) {
//         headers.set("authorization", `Bearer ${token}`);
//       }
//       return headers;
//     },
//   })(args, api, extraOptions);
// };

// export default fetchWithToken;
