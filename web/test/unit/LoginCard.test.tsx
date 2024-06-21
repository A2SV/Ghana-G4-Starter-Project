import React from "react";
import { render, screen } from "@testing-library/react";
import userEvent from "@testing-library/user-event";
import axios from "axios";
import MockAdapter from "axios-mock-adapter";
import LoginCard from "@/components/LoginCard";
import { useRouter } from "next/navigation";

// Mock environment variable
jest.mock("next-runtime-env", () => ({
  env: jest.fn(() => "http://blogapp.tryasp.net/api/"),
}));

// Mock axios
const mock = new MockAdapter(axios);

// Mock useRouter
jest.mock("next/navigation", () => ({
  useRouter: jest.fn(),
}));

const push = jest.fn();
(useRouter as jest.Mock).mockReturnValue({ push });

// Mock environment variable
jest.mock("next-runtime-env", () => ({
  env: jest.fn(() => "http://blogapp.tryasp.net/api/"),
}));

describe("LoginCard", () => {
  beforeEach(() => {
    mock.reset();
    push.mockClear();
  });

  it("renders the login form", () => {
    render(<LoginCard />);
    expect(screen.getByPlaceholderText(/Email address/i)).toBeInTheDocument();
    expect(screen.getByPlaceholderText(/Password/i)).toBeInTheDocument();
    expect(screen.getByRole("button", { name: /Sign in/i })).toBeInTheDocument();
  });

  it("toggles password visibility", () => {
    render(<LoginCard />);

    const passwordInput = screen.getByPlaceholderText(/Password/i);
    const toggleButton = screen.getByLabelText(/Show password/i);

    expect(passwordInput).toHaveAttribute("type", "password");

    userEvent.click(toggleButton);
    expect(passwordInput).toHaveAttribute("type", "password");
  });
});
