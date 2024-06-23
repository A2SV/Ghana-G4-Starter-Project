import { render, screen, RenderOptions } from "@testing-library/react";
import "@testing-library/jest-dom";
import Header from "../../components/Header";
import { SessionProvider, SessionProviderProps } from "next-auth/react";
import { ReactElement } from "react";

// Custom render function with proper typing
const customRender = (
  ui: ReactElement,

) => {
  return render(<SessionProvider >{ui}</SessionProvider>);
};

describe("Header", () => {
  it("renders blog link", () => {
    customRender(<Header />);
    const blogLink = screen.getByText(/blogs/i);
    expect(blogLink).toBeInTheDocument();
  });

  it("renders profile link", () => {
    customRender(<Header />);
    const profileLink = screen.getByText(/profile/i);
    expect(profileLink).toBeInTheDocument();
  });

  it("renders exactly 2 images", () => {
    customRender(<Header />);
    const images = screen.getAllByRole("img");
    expect(images.length).toBe(1);
  });
});
