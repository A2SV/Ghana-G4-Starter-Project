import { configureStore } from "@reduxjs/toolkit";
import { setupListeners } from "@reduxjs/toolkit/query";
import { blogApi } from "./blogApi";

export const store = configureStore({
  reducer: {
    [blogApi.reducerPath]: blogApi.reducer,
  },
  middleware: (getDefaultMiddleware) => getDefaultMiddleware().concat(blogApi.middleware),
});

setupListeners(store.dispatch);
export type RootState = ReturnType<typeof store.getState>;
export type AppDispatch = typeof store.dispatch;
