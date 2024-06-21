import fetchWithToken from "@/utils/Fetch_Token";
import { createApi } from "@reduxjs/toolkit/query/react";
import { Tag } from "@/types/tagTypes";

export const getTagsApi: any = createApi({
  reducerPath: "getTagsApi",
  baseQuery: fetchWithToken,
  endpoints: (builder) => ({
    getTags: builder.query<Tag[], void>({
      query: () => ({
        url: `Tag/`,
        method: "GET",
      }),
    }),
  }),
});

export const { useGetTagsQuery } = getTagsApi;
