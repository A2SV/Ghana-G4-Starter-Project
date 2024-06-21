"use client";

import React, { useState, useEffect } from "react";
import PostCard from "./PostCard";
import { useGetAllBlogsQuery } from "../redux/blogApi";
import { BlogPost } from "@/types/blogTypes";
import Link from "next/link";

const AllPost: React.FC = () => {
  const { data, error, isLoading } = useGetAllBlogsQuery();

  const [allBlogs, setAllBlogs] = useState<any>([]);

  useEffect(() => {
    if (data) {
      console.log(data);
      setAllBlogs(data);
    }
  }, [data]);

  return (
    <div className="bg-white min-h-screen p-6 w-full max-w-7xl mx-auto">
      <div>
        <div className="flex flex-col md:flex-row items-center p-5 border-b border-gray-100 font-montserrat">
          <div className="w-full md:w-[40%]">
            <h1 className="text-xl font-bold mx-10">Blogs</h1>
          </div>
          <div className="flex sm:flex-row items-center w-full md:w-[50%] mt-4 md:mt-0">
            <input
              type="text"
              placeholder="Search..."
              className="mr-3 p-2 border border-gray-300 rounded-3xl w-[40%] md:w-auto"
            />
            <button className="mr-3 mt-2 md:mt-0 px-4 py-2 bg-blue text-white text-sm rounded-3xl">
              + New Blog
            </button>
          </div>
        </div>
        <div>
          <div>
            {error ? (
              <>Oh no, there was an error</>
            ) : isLoading ? (
              <>Loading...</>
            ) : (
              allBlogs.map((post: BlogPost) => (
                <Link key={post.id} href={`/blog/single/${post.id}`}>
                  <PostCard
                    author={`${post.userAccount.firstName} ${post.userAccount.lastName}`}
                    date={post.createdDateTime.substring(0, 10)}
                    role="SOFTWARE ENGINEER"
                    title={post.title}
                    content={post.body}
                    tags={post.tags.map((tag) => tag.label)}
                  />
                </Link>
              ))
            )}
          </div>
        </div>
        <div className="flex justify-center py-5 mt-5 font-poppins">
          {[1, 2, 3, 4, 5].map((page) => (
            <button
              key={page}
              className="mx-1 px-3 py-1 bg-gray-200 text-bold text-black rounded hover:bg-blue hover:text-white"
            >
              {page}
            </button>
          ))}
        </div>
      </div>
    </div>
  );
};

export default AllPost;
