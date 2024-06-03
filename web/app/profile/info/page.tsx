import Footer from "@/components/Footer";
import Header from "@/components/Header";
import ProfileInfo from "@/components/ProfileInfo";
import ProfileNavigation from "@/components/ProfileNavigation";
import React from "react";

const Info = () => {
  return (
    <div>
      <Header />
      <ProfileNavigation />
      <ProfileInfo />
      <Footer />
    </div>
  );
};

export default Info;
