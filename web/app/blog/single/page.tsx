import React from "react";
import SingleBlog from "@/components/SingleBlog";
import Footer from "@/components/Footer";
import Header from "@/components/Header";
import CardsContainer from "@/components/CardsContainer";

const page = () => {
  return (
    <div>
      <Header />
      <SingleBlog />
      <CardsContainer />
      <Footer />
    </div>
  );
};

export default page;
