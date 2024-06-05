import React from "react";
import { render, screen } from "@testing-library/react";
import SingleBlog from "@/components/SingleBlog";

test("renders the SingleBlog component", () => {
  render(<SingleBlog />);

  // Assert that the component renders the expected elements
  expect(screen.getByText("The essential guide to Competitive Programming")).toBeInTheDocument();
  expect(screen.getByAltText("single blog")).toBeInTheDocument();
  expect(screen.getByAltText("profile picture")).toBeInTheDocument();
  expect(screen.getByText("chaltu kebede | software engineer")).toBeInTheDocument();
  expect(screen.getByText("@chaltu_kebede")).toBeInTheDocument();
  expect(
    screen.getByText(
      "We know that data structure and algorithm can seem hard at first glance. And you may not be familiar with advanced algorithms, but there are simple steps you can follow to see outstanding results in a short period of time."
    )
  ).toBeInTheDocument();
});
