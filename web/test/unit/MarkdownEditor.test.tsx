import React from "react";
import { render, screen, fireEvent } from "@testing-library/react";
import "@testing-library/jest-dom";
import MarkdownEditor from "@/components/MarkdownEditor";

jest.mock("react-simplemde-editor", () => {
  const MockSimpleMDE = (props: any) => (
    <textarea data-testid="markdown-editor" onChange={(e) => props.onChange(e.target.value)} />
  );
  MockSimpleMDE.displayName = "SimpleMDE";
  return MockSimpleMDE;
});

describe("MarkdownEditor", () => {
  test("renders the editor", () => {
    const handleChange = jest.fn();
    render(<MarkdownEditor onChange={handleChange} />);

    const textarea = screen.getByTestId("markdown-editor");
    expect(textarea).toBeInTheDocument();
  });

  test("calls onChange when content changes", () => {
    const handleChange = jest.fn();
    render(<MarkdownEditor onChange={handleChange} />);

    const textarea = screen.getByTestId("markdown-editor");
    fireEvent.change(textarea, { target: { value: "Hello, world!" } });

    expect(handleChange).toHaveBeenCalledWith("Hello, world!");
  });
});
