import React from "react";
import { render, screen } from "@testing-library/react";
import "@testing-library/jest-dom";
import FileUpload from "@/components/FileUpload";

describe("FileUpload", () => {
  test("renders upload image and upload button", () => {
    render(<FileUpload />);

    const image = screen.getByAltText("Upload Image");
    const uploadButton = screen.getByText(/upload file/i);

    expect(image).toBeInTheDocument();
    expect(uploadButton).toBeInTheDocument();
  });

  test("renders Please text", () => {
    render(<FileUpload />);

    const pleaseText = screen.getByText(/please,/i);

    expect(pleaseText).toBeInTheDocument();
  });
});
