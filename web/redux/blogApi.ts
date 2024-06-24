import fetchWithToken from "@/utils/Fetch_Token";
import { createApi } from "@reduxjs/toolkit/query/react";
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
    getBlogById: builder.query<BlogPost[], { blogId: string }>({
      query: (queryArg) => ({
        url: `Blog/${queryArg.blogId}`,
        method: "GET",
      }),
    }),
  }),
});

export const { useGetAllBlogsQuery, useGetBlogByIdQuery } = blogApi;
