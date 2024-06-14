import React from "react";
import Header from "./Header";
import ProfileNavigation from "./ProfileNavigation";
import ProfileBlogsCard from "./ProfileBlogsCard";
import Footer from "./Footer";
import Link from "next/link";

const ProfileBlogs = () => {
  return (
    <div className="flex flex-col">
      <Header />
      <ProfileNavigation />
      <div className="flex md:flex-row flex-col px-[50px] pt-[30px] justify-between space-y-8">
        <div className="flex flex-col space-y-2">
          <p className="text-[18px] text-[#5D5D5D] ">Manage blogs</p>
          <p className="text-[12px] text-[#868686]">
            Edit, Delete and View the Status of your blogs
          </p>
        </div>

        <div className="flex flex-col">
          <Link href="/blog">
            <button className="bg-[#264FAD] py-2 px-12 rounded-md text-white font-bold text-[14px]">
              New Blog
            </button>
          </Link>
        </div>
      </div>

      <div className="px-[50px] py-[30px] flex flex-wrap justify-center mb-[100px]">
        <div className="w-full md:w-1/2 xl:w-1/3 2xl:w-1/4 p-2">
          <ProfileBlogsCard />
        </div>
        <div className="w-full md:w-1/2 xl:w-1/3 2xl:w-1/4 p-2">
          <ProfileBlogsCard />
        </div>
        <div className="w-full md:w-1/2 xl:w-1/3 2xl:w-1/4 p-2">
          <ProfileBlogsCard />
        </div>
        <div className="w-full md:w-1/2 xl:w-1/3 2xl:w-1/4 p-2">
          <ProfileBlogsCard />
        </div>
      </div>

      <Footer />
    </div>
  );
};

export default ProfileBlogs;
