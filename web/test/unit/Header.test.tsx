import { render, screen } from "@testing-library/react";
import "@testing-library/jest-dom";
import Header from "../../components/Header";

describe("Header", () => {
  it("renders blog link", () => {
    render(<Header />);
    const blogLink = screen.getByText(/blog/i);
    expect(blogLink).toBeInTheDocument();
  });

  it("renders profile link", () => {
    render(<Header />);
    const profileLink = screen.getByText(/profile/i);
    expect(profileLink).toBeInTheDocument();
  });

  it("renders exactly 2 images", () => {
    render(<Header />);
    const images = screen.getAllByRole("img");
    expect(images.length).toBe(2);
  });
});
