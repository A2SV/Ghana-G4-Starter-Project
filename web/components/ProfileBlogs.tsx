"use client";
import React from "react";

import Header from "./Header";
import ProfileNavigation from "./ProfileNavigation";
import ProfileBlogsCard from "./ProfileBlogsCard";
import Footer from "./Footer";
import Link from "next/link";
import { useMyBlogsQuery } from "@/redux/myBlogsApi";
import { Blog } from "@/types/myBlogTypes";

const ProfileBlogs: React.FC = () => {
  const userAccountId = 3;
  const { data: blogs, error, isLoading } = useMyBlogsQuery({ userAccountId });

  if (isLoading) return <div>Loading...</div>;
  if (error) return <div>Error loading blogs</div>;

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
          <Link href="/blog">
            <button className="bg-[#264FAD] py-2 px-12 rounded-md text-white font-bold text-[14px]">
              New Blog
            </button>
          </Link>
        </div>
      </div>

      <div className="px-[50px] py-[30px] flex md:flex-row flex-col flex-wrap justify-between mb-[100px] items-center">
        {blogs && blogs.map((blog: Blog) => <ProfileBlogsCard key={blog.id} blog={blog} />)}
      </div>

      <Footer />
    </div>
  );
};

export default ProfileBlogs;
