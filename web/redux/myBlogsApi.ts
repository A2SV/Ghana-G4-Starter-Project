import fetchWithToken from "@/utils/Fetch_Token";
import { createApi } from "@reduxjs/toolkit/query/react";

export const myBlogsApi: any = createApi({
  reducerPath: "myBlogsApi",
  baseQuery: fetchWithToken,
  endpoints: (builder) => ({
    myBlogs: builder.query<any, { userAccountId: number }>({
      query: (queryArg) => ({
        url: `Blog/user/${queryArg.userAccountId}`,
        method: "GET",
      }),
    }),
  }),
});

export const { useMyBlogsQuery } = myBlogsApi;
