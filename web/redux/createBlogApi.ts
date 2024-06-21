import fetchWithToken from "@/utils/Fetch_Token";

import { createApi } from "@reduxjs/toolkit/query/react";

export const createBlogApi: any = createApi({
  reducerPath: "createBlogApi",
  baseQuery: fetchWithToken,
  endpoints: (builder) => ({
    createBlog: builder.mutation<any, { title: string; body: string; tags: any[] }>({
      query: (queryArg) => ({
        url: `Blog/create`,
        method: "POST",
        body: {
          title: queryArg.title,
          body: queryArg.body,
          tags: queryArg.tags,
        },
      }),
    }),
  }),
});

export const { useCreateBlogMutation } = createBlogApi;
