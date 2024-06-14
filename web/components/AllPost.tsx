"use client";

// import React, { useState, useEffect } from "react";
import PostCard from "./PostCard";
// import { useGetAllBlogsQuery } from "../redux/blogApi";

const AllPost: React.FC = () => {
  // const { data, error, isLoading } = useGetAllBlogsQuery();

  // const [allBlogs, setAllBlogs] = useState<any>([]);

  // useEffect(() => {
  //   // console.log(data)
  //   if (data) {
  //     console.log(data);
  //     setAllBlogs(data);
  //   }
  // }, [data]);

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
          {/* <div>
            {isLoading ? (
              <p>Loading posts...</p>
            ) : (
              <>
                {allBlogs.map((post: any) => {
                  return <p>{post.title}</p>;
                })}
              </>
            )}
          </div> */}
          <PostCard
            author="Yididiya Kebede"
            date="Apr 16, 2022"
            role="SOFTWARE ENGINEER"
            title="The essential guide to Competitive Programming"
            content="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea"
            tags={["UI/UX", "Development"]}
          />
          <PostCard
            author="Yididiya Kebede"
            date="Apr 16, 2022"
            role="SOFTWARE ENGINEER"
            title="The essential guide to Competitive Programming"
            content="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea"
            tags={["UI/UX", "Development"]}
          />
          <PostCard
            author="Yididiya Kebede"
            date="Apr 16, 2022"
            role="SOFTWARE ENGINEER"
            title="The essential guide to Competitive Programming"
            content="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea"
            tags={["UI/UX", "Development"]}
          />
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
