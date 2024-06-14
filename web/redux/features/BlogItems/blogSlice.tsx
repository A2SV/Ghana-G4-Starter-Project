import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  data: null,
  isLoading: false,
  error: null,
};

export const blogSlice = createSlice({
  name: "blogItems",
  initialState,
  reducers: {
    getDataStart: (state) => {
      state.isLoading = true;
    },
    getDataSuccess: (state, action) => {
      state.data = action.payload;
      state.isLoading = false;
    },
    getDataFailure: (state, action) => {
      state.error = action.payload;
      state.isLoading = false;
    },
  },
});

export const { getDataStart, getDataSuccess, getDataFailure } = blogSlice.actions;

export default blogSlice.reducer;
