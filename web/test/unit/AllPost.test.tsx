import { render, screen } from "@testing-library/react";
import AllPost from "@/components/AllPost";

test("renders AllPost component and checks for blogs text, search input, and new blog button", () => {
  render(<AllPost />);

  const blogsText = screen.getByText(/blogs/i);
  expect(blogsText).toBeInTheDocument();

  const searchInput = screen.getByPlaceholderText(/search/i);
  expect(searchInput).toBeInTheDocument();

  const newBlogButton = screen.getByText("+ New Blog");
  expect(newBlogButton).toBeInTheDocument();
});
