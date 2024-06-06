import React from "react";
import { render, screen } from "@testing-library/react";
import "@testing-library/jest-dom";
import ProfileInfo from "@/components/ProfileInfo";

describe("ProfileInfo", () => {
  it("renders 'Manage Personal Information' text", () => {
    render(<ProfileInfo />);
    const manageInfoText = screen.getByText(/Manage Personal Information/i);
    expect(manageInfoText).toBeInTheDocument();
  });

  it("renders 'Add all the required information about yourself' text", () => {
    render(<ProfileInfo />);
    const addInfoText = screen.getByText(/Add all the required information about yourself/i);
    expect(addInfoText).toBeInTheDocument();
  });

  it("renders 'Save Changes' button", () => {
    render(<ProfileInfo />);
    const saveChangesButton = screen.getByRole("button", { name: /Save Changes/i });
    expect(saveChangesButton).toBeInTheDocument();
  });

  it("renders 'Name', 'Email', and 'Your Photo' labels", () => {
    render(<ProfileInfo />);
    const nameLabel = screen.getByLabelText(/Name/i);
    const emailLabel = screen.getByLabelText(/Email/i);
    expect(nameLabel).toBeInTheDocument();
    expect(emailLabel).toBeInTheDocument();
  });

  it("renders an image", () => {
    render(<ProfileInfo />);
    const image = screen.getByRole("img");
    expect(image).toBeInTheDocument();
  });

  it("renders an image", () => {
    render(<ProfileInfo />);
    const image = screen.getByRole("img");
    expect(image).toBeInTheDocument();
  });
});
