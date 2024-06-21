import { configureStore } from "@reduxjs/toolkit";
import { createBlogApi } from "./createBlogApi";
import { env } from "next-runtime-env";
import { setupListeners } from "@reduxjs/toolkit/query";
import { myBlogsApi } from "./myBlogsApi";
import { getTagsApi } from "./getTagsApi";

export const store = configureStore({
  reducer: {
    [createBlogApi.reducerPath]: createBlogApi.reducer,
    [myBlogsApi.reducerPath]: myBlogsApi.reducer,
    [getTagsApi.reducerPath]: getTagsApi.reducer,
  },

  devTools: env("NEXT_PUBLIC_NODE_ENV") !== "production",
  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware({}).concat([
      createBlogApi.middleware,
      myBlogsApi.middleware,
      getTagsApi.middleware,
    ]),
});

setupListeners(store.dispatch);
export type RootState = ReturnType<typeof store.getState>;
export type AppDispatch = typeof store.dispatch;
