import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  data: null,
  isLoading: false,
  error: null,
};

export const tagSlice = createSlice({
  name: "tagItems",
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

export const { getDataStart, getDataSuccess, getDataFailure } = tagSlice.actions;

export default tagSlice.reducer;
