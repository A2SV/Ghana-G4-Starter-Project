import fetchWithToken from "@/utils/Fetch_Token";
import { createApi, fetchBaseQuery } from "@reduxjs/toolkit/query/react";
import { env } from "next-runtime-env";
import { BlogPost } from "@/types/blogTypes";

export const blogApi = createApi({
  reducerPath: "blogApi",
  baseQuery: fetchWithToken,
  endpoints: (builder) => ({
    getAllBlogs: builder.query<BlogPost[], void>({
      query: () => ({
        url: `Blog`,
        method: "GET",
      }),
    }),
  }),
});

export const { useGetAllBlogsQuery } = blogApi;
