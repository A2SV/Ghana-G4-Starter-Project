import React from "react";
import { render, screen } from "@testing-library/react";
import userEvent from "@testing-library/user-event";
import "@testing-library/jest-dom";
import ActionButtons from "@/components/ActionButtons";

describe("ActionButtons", () => {
  test("renders the Cancel and Create Blog buttons", () => {
    render(<ActionButtons />);

    const cancelButton = screen.getByRole("button", { name: /cancel/i });
    const createBlogButton = screen.getByRole("button", { name: /create blog/i });

    expect(cancelButton).toBeInTheDocument();
    expect(createBlogButton).toBeInTheDocument();
  });

  test("Cancel button has correct initial styles and hover effect", () => {
    render(<ActionButtons />);

    const cancelButton = screen.getByRole("button", { name: /cancel/i });

    expect(cancelButton).toHaveClass("text-btn");
    expect(cancelButton).toHaveClass("py-2", "px-5", "rounded");

    userEvent.hover(cancelButton);
    expect(cancelButton).toHaveClass("hover:bg-btn", "hover:text-white");
  });

  test("Create Blog button has correct initial styles and hover effect", () => {
    render(<ActionButtons />);

    const createBlogButton = screen.getByRole("button", { name: /create blog/i });

    expect(createBlogButton).toHaveClass("bg-btn", "text-white", "py-2", "px-5", "rounded");

    userEvent.hover(createBlogButton);
    expect(createBlogButton).toHaveClass("hover:bg-varietyBlue");
  });
});
