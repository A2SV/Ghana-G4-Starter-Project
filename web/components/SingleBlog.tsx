import React from "react";
import Image from "next/image";
import SingleImage from "@/public/single_blog.jpg";
import ProfileImage from "@/public/profile_picture.png";

const SingleBlog = () => {
  return (
    <div className="flex flex-col justify-center items-center">
      <div className="ml-5 font-montserrat">
        <h1 className="top-270 font-imfell text-4xl left-565 pb-5">
          The essential guide to Competitive Programming
        </h1>
        <p className="flex justify-center items-center font-montserrat text-sm pt-4">
          Programming, tech | 6 min Read
        </p>
      </div>
      <Image className="p-10 w-1586px h-792px" src={SingleImage} alt="single blog" />
      <Image className="pt-200 pb-200 w-20 h-20" src={ProfileImage} alt="profile picture" />
      <p className="font-imfell pt-3 pb-3 text-gray-600">chaltu kebede | software engineer</p>
      <p className="text-blue mb-7">@chaltu_kebede</p>
      <div className="flex flex-col justify-center items-center font-montserrat text-sm text-gray-500">
        <p className="m-7 font-imfell text-black text-2xl">
          We know that data structure and algorithm can seem hard at first glance. And <br /> you
          may not be familiar with advanced algorithms, but there are simple steps you <br /> can
          follow to see outstanding results in a short period of time.
        </p>

        <p className="m-4">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
          ut labore et dolore <br />
          magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
          aliquip ex ea commodo <br /> consequat. Duis aute irure dolor in reprehenderit in{" "}
          voluptate velit esse cillum dolore eu fugiat nulla pariatur. <br /> Excepteur sint
          occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
          laborum. <br />
        </p>

        <p className="m-4">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
          ut labore et dolore <br />
          magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
          aliquip ex ea commodo <br /> consequat. Duis aute irure dolor in reprehenderit in{" "}
          voluptate velit esse cillum dolore eu fugiat nulla pariatur. <br /> Excepteur sint
          occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
          laborum. <br />
        </p>

        <p className="m-4">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
          ut labore et dolore <br />
          magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
          aliquip ex ea commodo <br /> consequat. Duis aute irure dolor in reprehenderit in{" "}
          voluptate velit esse cillum dolore eu fugiat nulla pariatur. <br /> Excepteur sint
          occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
          laborum. <br />
        </p>

        <p className="m-4">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
          ut labore et dolore <br />
          magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
          aliquip ex ea commodo <br /> consequat. Duis aute irure dolor in reprehenderit in{" "}
          voluptate velit esse cillum dolore eu fugiat nulla pariatur. <br /> Excepteur sint
          occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
          laborum. <br />
        </p>
      </div>
    </div>
  );
};

export default SingleBlog;
