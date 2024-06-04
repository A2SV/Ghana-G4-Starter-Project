import React from "react";
import { render, screen } from "@testing-library/react";
import "@testing-library/jest-dom";
import BlogHeader from "@/components/BlogHeader";

describe("BlogHeader", () => {
  test("renders the title input", () => {
    render(<BlogHeader />);

    const titleInput = screen.getByPlaceholderText(/enter the title of the blog/i);

    expect(titleInput).toBeInTheDocument();
  });
});
