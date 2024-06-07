import React from "react";
import { render, screen } from "@testing-library/react";
import "@testing-library/jest-dom";
import CardsContainer from "../../components/CardsContainer";

describe("RelatedBlog", () => {
  it("renders 'Related Blogs' text", () => {
    render(<CardsContainer />);
    const relatedBlogsText = screen.getByText("Related Blogs");
    expect(relatedBlogsText).toBeInTheDocument();
  });

  it("renders the ParentComponent and checks for RelatedBlog", () => {
    render(<CardsContainer />);
    const parentComponent = screen.getByTestId("parent-component");
    expect(parentComponent).toBeInTheDocument();
  });
});
