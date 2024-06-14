import React from "react";
import Image from "next/image";
import BlogHeader from "@/components/BlogHeader";
import TagSelector from "@/components/TagSelector";
import ActionButtons from "@/components/ActionButtons";
import TextEditor from "@/components/TextEditor";
import Header from "@/components/Header";
import Footer from "@/components/Footer";
import SingleImage from "@/public/single_blog.jpg";

const NewBlogMain: React.FC = () => {
  return (
    <div>
      <Header />
      <div className="flex flex-col xl:flex-row">
        <div className="order-1 ml-14 pl-4 lg:border-l lg:border-gray-200 lg:ml-20 lg:pl-8 xl:ml-32 xl:pl-12 xl:order-2 xl:w-4/12">
          <TagSelector />
        </div>
        <div className=" order-2 flex flex-col mb-40 ml-14 lg:ml-20 xl:ml-32 xl:order-1 xl:w-8/12">
          <BlogHeader />
          <Image className="px-10 py-3 w-1586px h-792px" src={SingleImage} alt="single blog" />
          <div className="flex flex-row h-9 mb-5 justify-center items-center">
            <p className="mr-2 text-sm font-montserrat">Change Photo</p>
            <label className="inline-flex items-center px-3 py-1 bg-white font-montserrat text-sm text-gray-700 rounded-md cursor-pointer  hover:bg-slate-200">
              Upload File
              <input type="file" className="hidden" />
            </label>
          </div>
          <TextEditor />
          <ActionButtons />
        </div>
      </div>

      <Footer />
    </div>
  );
};

export default NewBlogMain;
