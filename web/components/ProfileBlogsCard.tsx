"use client";
import React from "react";
import Image from "next/image";
import Link from "next/link";
import { FaEdit } from "react-icons/fa";
import { Blog } from "@/types/myBlogTypes";

interface ProfileBlogsCardProps {
  blog: Blog;
}

const ProfileBlogsCard: React.FC<ProfileBlogsCardProps> = ({ blog }) => {
  return (
    <div>
      <div
        data-testid="blog-card"
        className="md:w-[250px] w-[300px]  flex flex-col space-y-5 pb-[60px] shadow-sm"
      >
        <Image src="/BlogImage.svg" width={250} height={150} alt="Blog Image" />
        <div className="pt-2 px-[10px]">
          <p className="text-[12px] text-[#5E5873]"> {blog.title} </p>
          <div className="flex flex-row pt-2 mb-2">
            <Image src="/Avatar.svg" width={20} height={20} className="rounded-lg" alt="avatar" />
            <p className="text-[#B9B9C3] text-[12px] px-2">by</p>
            <p className="text-[#6E6B7B] text-[14px]">
              <span>{`${blog.userAccount?.firstName} ${blog.userAccount?.lastName}`}</span>
            </p>
            <p className="text-[14px] text-[#B9B9C3] pl-2">
              {blog.createdDateTime ? new Date(blog.createdDateTime).toLocaleDateString() : ""}
            </p>
          </div>

          <div className="flex flex-row pt-2 space-x-6  pb-[14px]">
            {Array.isArray(blog.tags) &&
              blog.tags.map((tag, index) => (
                <button
                  key={index}
                  className="px-[12px] py-[6px] bg-[#F5F5F5] rounded-lg text-[8px] text-[#8E8E8E] font-semibold font-montserrat"
                >
                  {tag.label.toUpperCase()}
                </button>
              ))}
          </div>
          <p className="text-[10px] text-[#6E6B7B]">{blog.body}</p>
          <Link href="/profile/myblogs/edit">
            <div className="flex">
              <div className="flex flex-row-reverse w-8 h-6 bg-gray-200 text-gray-500 items-center justify-center mt-3 rounded-[3px] hover:bg-gray-300 hover:text-gray-500 transition duration-300">
                <FaEdit className="w-4 h-4" />
              </div>
            </div>
          </Link>
          <div className="border-b border-[#EBE9F1] pt-[40px]"></div>
        </div>
      </div>
    </div>
  );
};

export default ProfileBlogsCard;
