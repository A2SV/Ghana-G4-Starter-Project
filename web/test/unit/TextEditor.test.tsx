import React from "react";
import { render, screen, fireEvent } from "@testing-library/react";
import "@testing-library/jest-dom";
import BlogCreatorPage from "@/components/TextEditor";

jest.mock("@/components/MarkdownEditor", () => {
  return jest.fn(({ onChange }) => (
    <textarea data-testid="markdown-editor" onChange={(e) => onChange(e.target.value)} />
  ));
});

describe("BlogCreatorPage", () => {
  test("renders the MarkdownEditor", () => {
    const mockOnChange = jest.fn();
    render(<BlogCreatorPage value="" onChange={mockOnChange} />);

    const textarea = screen.getByTestId("markdown-editor");
    expect(textarea).toBeInTheDocument();
  });

  test("calls onChange with the new content", () => {
    const mockOnChange = jest.fn();
    render(<BlogCreatorPage value="" onChange={mockOnChange} />);

    const textarea = screen.getByTestId("markdown-editor");
    fireEvent.change(textarea, { target: { value: "Hello, world!" } });

    expect(mockOnChange).toHaveBeenCalledWith("Hello, world!");
  });
});
