import React from "react";
import { render, screen, waitFor } from "@testing-library/react";
import userEvent from "@testing-library/user-event";
import "@testing-library/jest-dom";
import TagSelector from "@/components/TagSelector";

describe("TagSelector", () => {
  test("renders all tags", () => {
    render(<TagSelector />);

    const tags = [
      "Development",
      "Sports",
      "Writing",
      "Self Improvement",
      "Technology",
      "Social",
      "Data Science",
      "Programming",
    ];

    tags.forEach((tag) => {
      const tagButton = screen.getByText(tag);
      expect(tagButton).toBeInTheDocument();
    });
  });

  test("clicking a tag updates the active tag", async () => {
    render(<TagSelector />);

    const tagButton = screen.getByText(/sports/i);
    userEvent.click(tagButton);

    await waitFor(() => {
      expect(tagButton).toHaveClass("text-btn bg-white border-2 border-btn");
    });
  });
});
