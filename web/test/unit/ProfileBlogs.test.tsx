import "@testing-library/jest-dom";
import React from "react";
import { render, screen } from "@testing-library/react";
import ProfileBlogs from "@/components/ProfileBlogs";

describe("ProfileBlogs", () => {
  it("renders blog link", () => {
    render(<ProfileBlogs />);
  });

  it("displays Manage blogs text", () => {
    render(<ProfileBlogs />);
    expect(screen.getByText("Manage blogs")).toBeInTheDocument();
    expect(screen.getByText("Edit, Delete and View the Status of your blogs")).toBeInTheDocument();
  });

  it("renders exactly 11 images", () => {
    render(<ProfileBlogs />);
    const images = screen.getAllByRole("img");
    expect(images.length).toBe(11);
  });
});
