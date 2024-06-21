import React from "react";
import { render, screen, waitFor } from "@testing-library/react";
import userEvent from "@testing-library/user-event";
import "@testing-library/jest-dom";
import TagSelector from "@/components/TagSelector";
import { useGetTagsQuery } from "@/redux/getTagsApi";

jest.mock("@/redux/getTagsApi");

describe("TagSelector", () => {
  const mockTags = [
    {
      id: 1,
      label: "Health",
      description: "The topic of human well-being",
    },
    {
      id: 2,
      label: "Sport",
      description: "The topic of physical games and exercise",
    },
    {
      id: 3,
      label: "Technology",
      description: "The topic of advancements in science and engineering",
    },
    {
      id: 4,
      label: "Travel",
      description: "The topic of exploring different places around the world",
    },
    {
      id: 5,
      label: "Food",
      description: "The topic of culinary delights and recipes",
    },
    {
      id: 6,
      label: "Education",
      description: "The topic of learning and academic pursuits",
    },
  ];
  beforeEach(() => {
    useGetTagsQuery.mockReturnValue({
      data: mockTags,
      isLoading: false,
      isError: false,
    });
  });

  test("renders all tags", () => {
    const mockOnChange = jest.fn();
    render(<TagSelector onChange={mockOnChange} />);

    mockTags.forEach((tag) => {
      const tagButton = screen.getByText(tag.label);
      expect(tagButton).toBeInTheDocument();
    });
  });

  test("clicking a tag updates the active tag", async () => {
    const mockOnChange = jest.fn();
    render(<TagSelector onChange={mockOnChange} />);

    const tagButton = screen.getByText(/Sport/i);
    userEvent.click(tagButton);

    await waitFor(() => {
      expect(tagButton).toHaveClass("text-btn bg-white border-2 border-btn");
    });
  });
});
