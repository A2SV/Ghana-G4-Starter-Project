import Header from "@/components/Header";
import Footer from "@/components/Footer";
import AllPost from '@/components/AllPost'
import React from "react";

const DefaultPage = () => {
  return (
    <div>
      <Header />
      <AllPost/>
      <Footer />
    </div>
  );
};

export default DefaultPage;
