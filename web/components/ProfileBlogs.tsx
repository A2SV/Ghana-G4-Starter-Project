import React from "react";
import Header from "./Header";
import ProfileNavigation from "./ProfileNavigation";
import ProfileBlogsCard from "./ProfileBlogsCard";
import Footer from "./Footer";

const ProfileBlogs = () => {
  return (
    <div>
      <Header />
      <ProfileNavigation />
      <div className="flex md:flex-row flex-col px-[30px] pt-[30px] justify-between space-y-8">
        <div className="flex flex-col space-y-2">
          <p className="text-[18px] text-[#5D5D5D] ">Manage blogs</p>
          <p className="text-[12px] text-[#868686]">
            Edit, Delete and View the Status of your blogs
          </p>
        </div>

        <div className="flex flex-col">
          <button className="bg-[#264FAD] py-2 px-12 rounded-md text-white font-bold text-[14px]">
            New Blog
          </button>
        </div>
      </div>

      <div className="px-[50px] py-[30px] flex md:flex-row flex-col flex-wrap justify-between mb-[100px] items-center">
        <ProfileBlogsCard />
        <ProfileBlogsCard />
        <ProfileBlogsCard />
        <ProfileBlogsCard />
      </div>

      <Footer />
    </div>
  );
};

export default ProfileBlogs;
