import React from "react";
import { render, screen } from "@testing-library/react";
import "@testing-library/jest-dom";
import BlogHeader from "@/components/BlogHeader";

describe("BlogHeader", () => {
  test("renders the title input", () => {
    const mockOnChange = jest.fn();

    render(<BlogHeader value="" onChange={mockOnChange} />);

    const titleInput = screen.getByPlaceholderText(/enter the title of the blog/i);

    expect(titleInput).toBeInTheDocument();
  });
});
