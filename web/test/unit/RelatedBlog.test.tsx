import React from "react";
import { render, screen } from "@testing-library/react";
import "@testing-library/jest-dom";
import RelatedBlog from "../../components/RelatedBlog";

describe("RelatedBlog", () => {
  it("renders the expected text", () => {
    render(<RelatedBlog />);
    const expectedText = screen.getByText("Design Liberalized Exchanged Rate Management");
    expect(expectedText).toBeInTheDocument();
  });

  it("renders the author name", () => {
    render(<RelatedBlog />);
    const authorName = screen.getByText("Fred Boone");
    expect(authorName).toBeInTheDocument();
  });

  it("renders the date", () => {
    render(<RelatedBlog />);
    const date = screen.getByText("Jan 10, 2020");
    expect(date).toBeInTheDocument();
  });

  it("renders the UI/UX text", () => {
    render(<RelatedBlog />);
    const uiuxText = screen.getByText("UI/UX");
    expect(uiuxText).toBeInTheDocument();
  });

  it("renders the Development text", () => {
    render(<RelatedBlog />);
    const developmentText = screen.getByText("Development");
    expect(developmentText).toBeInTheDocument();
  });

  it("renders the blog personality text", () => {
    render(<RelatedBlog />);
    const personalityText = screen.getByText(
      "A little personality goes a long way, especially on a business blog. So don’t be afraid to let loose."
    );
    expect(personalityText).toBeInTheDocument();
  });

  it("renders the '2.3k Likes' text", () => {
    render(<RelatedBlog />);
    const likesText = screen.getByText("2.3k Likes");
    expect(likesText).toBeInTheDocument();
  });

  it("renders the 'Read More' text", () => {
    render(<RelatedBlog />);
    const readMoreText = screen.getByText("Read More");
    expect(readMoreText).toBeInTheDocument();
  });
});
