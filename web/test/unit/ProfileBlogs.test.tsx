import "@testing-library/jest-dom";
import React from "react";
import { render, screen, waitFor } from "@testing-library/react";
import ProfileBlogs from "@/components/ProfileBlogs";
import { useMyBlogsQuery } from "@/redux/myBlogsApi";

jest.mock("@/redux/myBlogsApi");

const mockBlogs = [
  {
    id: 29,
    title: "gjdgydhmgkuy",
    body: "xghnkduyj,",
    createdDateTime: "2024-06-19T19:46:53.9764444",
    userAccount: {
      id: 3,
      firstName: "akua",
      lastName: "nkrumah",
      email: "john@gmail.com",
      createdDateTime: "2024-06-04T18:01:47.6058252",
    },
    tags: [],
  },
  {
    id: 30,
    title: "mytitle",
    body: "my first post",
    createdDateTime: "2024-06-19T21:03:55.5269317",
    userAccount: {
      id: 3,
      firstName: "akua",
      lastName: "nkrumah",
      email: "john@gmail.com",
      createdDateTime: "2024-06-04T18:01:47.6058252",
    },
    tags: [],
  },
  {
    id: 31,
    title: "My fourth Post",
    body: "React Framework is impressive",
    createdDateTime: "2024-06-20T00:28:35.153113",
    userAccount: {
      id: 3,
      firstName: "akua",
      lastName: "nkrumah",
      email: "john@gmail.com",
      createdDateTime: "2024-06-04T18:01:47.6058252",
    },
    tags: [],
  },
  {
    id: 32,
    title: "ss/lz.km,z.vf",
    body: "zkfl,mbvoslfl",
    createdDateTime: "2024-06-20T00:44:32.9427209",
    userAccount: {
      id: 3,
      firstName: "akua",
      lastName: "nkrumah",
      email: "john@gmail.com",
      createdDateTime: "2024-06-04T18:01:47.6058252",
    },
    tags: [],
  },
  {
    id: 33,
    title: "title5",
    body: "my fifth post",
    createdDateTime: "2024-06-20T09:52:35.6424076",
    userAccount: {
      id: 3,
      firstName: "akua",
      lastName: "nkrumah",
      email: "john@gmail.com",
      createdDateTime: "2024-06-04T18:01:47.6058252",
    },
    tags: [],
  },
  {
    id: 34,
    title: "title5",
    body: "my fifth post",
    createdDateTime: "2024-06-20T09:53:24.2479699",
    userAccount: {
      id: 3,
      firstName: "akua",
      lastName: "nkrumah",
      email: "john@gmail.com",
      createdDateTime: "2024-06-04T18:01:47.6058252",
    },
    tags: [],
  },
  {
    id: 35,
    title: "Design Liberalized Exchange Rate Management",
    body: "A little personality goes a long way, especially on a business blog. So don’t be afraid to let loose.",
    createdDateTime: "2024-06-20T10:02:17.9352564",
    userAccount: {
      id: 3,
      firstName: "akua",
      lastName: "nkrumah",
      email: "john@gmail.com",
      createdDateTime: "2024-06-04T18:01:47.6058252",
    },
    tags: [
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
    ],
  },
  {
    id: 36,
    title: "Competitive Programming",
    body: "I'm the best there is when it come to competitive programming.",
    createdDateTime: "2024-06-20T11:17:34.9506319",
    userAccount: {
      id: 3,
      firstName: "akua",
      lastName: "nkrumah",
      email: "john@gmail.com",
      createdDateTime: "2024-06-04T18:01:47.6058252",
    },
    tags: [
      {
        id: 3,
        label: "Technology",
        description: "The topic of advancements in science and engineering",
      },
      {
        id: 6,
        label: "Education",
        description: "The topic of learning and academic pursuits",
      },
    ],
  },
];

describe("ProfileBlogs", () => {
  beforeEach(() => {
    useMyBlogsQuery.mockReturnValue({
      data: mockBlogs,
      isLoading: false,
      error: null,
    });
  });

  it("renders blog link", () => {
    render(<ProfileBlogs />);
    const newBlogButton = screen.getByRole("button", { name: /New Blog/i });
    expect(newBlogButton).toBeInTheDocument();
  });

  it("displays Manage blogs text", () => {
    render(<ProfileBlogs />);
    expect(screen.getByText("Manage blogs")).toBeInTheDocument();
    expect(screen.getByText("Edit, Delete and View the Status of your blogs")).toBeInTheDocument();
  });

  it("renders the correct number of blogs", async () => {
    render(<ProfileBlogs />);
    await waitFor(() => {
      const blogs = screen.getAllByTestId("blog-card");
      expect(blogs.length).toBe(mockBlogs.length);
    });
  });
});
