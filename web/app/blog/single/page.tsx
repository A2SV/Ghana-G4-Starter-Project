import React from "react";
import SingleBlog from "@/components/SingleBlog";
import Footer from "@/components/Footer";
import Header from "@/components/Header";
import RelatedBlog from "@/components/RelatedBlog";

const page = () => {
  return (
    <div>
      <Header />
      <SingleBlog />
      <RelatedBlog />
      <Footer />
    </div>
  );
};

export default page;
