import "@testing-library/jest-dom";
import React from "react";
import { render, screen } from "@testing-library/react";
import SignUpBackground from "@/components/SignupBackground";


describe("SignUpBackground", () => {
  it("renders blog link", () => {
    render(<SignUpBackground />);
  });

  it("displays welcome text", () => {
    render(<SignUpBackground />);
    expect(screen.getByText("Welcome to")).toBeInTheDocument();
    expect(screen.getByText("A2SV")).toBeInTheDocument();
    expect(screen.getByText("Register for free to read blogs")).toBeInTheDocument();
  });

  it("renders exactly 2 images", () => {
    render(<SignUpBackground />);
    const images = screen.getAllByRole("img");
    expect(images.length).toBe(2);
  });
});
