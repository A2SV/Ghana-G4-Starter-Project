import React from "react";
import { render } from "@testing-library/react";
import Footer from "../../components/Footer";

describe("Footer component", () => {
  it("renders links properly", () => {
    const { getByText } = render(<Footer />);

    expect(getByText("Home")).toBeInTheDocument();
    expect(getByText("Success Stories")).toBeInTheDocument();
    expect(getByText("About Us")).toBeInTheDocument();
    expect(getByText("Get Involved")).toBeInTheDocument();
  });

  it("renders teams properly", () => {
    const { getByText } = render(<Footer />);

    expect(getByText("Board Members")).toBeInTheDocument();
    expect(getByText("Advisors/Mentors")).toBeInTheDocument();
    expect(getByText("Executive")).toBeInTheDocument();
    expect(getByText("Staffs")).toBeInTheDocument();
  });

  it("renders blogs properly", () => {
    const { getByText } = render(<Footer />);

    expect(getByText("Recent Blog")).toBeInTheDocument();
    expect(getByText("New Blog")).toBeInTheDocument();
  });

  it("renders footer text properly", () => {
    const { getByText } = render(<Footer />);

    expect(
      getByText("© 2020 Africa to Silicon Valley, Inc. All rights reserved")
    ).toBeInTheDocument();
  });
});
