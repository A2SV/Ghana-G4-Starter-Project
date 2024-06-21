import "@testing-library/jest-dom";
import React from "react";
import { render, screen } from "@testing-library/react";
import SignUpBackground from "@/components/SignupBackground";

// Mock the next/navigation module
jest.mock("next/navigation", () => ({
  useRouter: () => ({
    route: "/",
    pathname: "",
    query: "",
    asPath: "",
    push: jest.fn(),
    replace: jest.fn(),
    reload: jest.fn(),
    back: jest.fn(),
    prefetch: jest.fn().mockResolvedValue(undefined),
    beforePopState: jest.fn(),
    events: {
      on: jest.fn(),
      off: jest.fn(),
      emit: jest.fn(),
    },
    isFallback: false,
  }),
  useSearchParams: () => ({}),
}));

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
