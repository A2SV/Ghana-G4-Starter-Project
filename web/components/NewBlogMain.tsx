import React from "react";
import BlogHeader from "@/components/BlogHeader";
import FileUpload from "@/components/FileUpload";
import TagSelector from "@/components/TagSelector";
import ActionButtons from "@/components/ActionButtons";
import TextEditor from "@/components/TextEditor";
import Header from "@/components/Header";
import Footer from "@/components/Footer";

const NewBlogMain: React.FC = () => {
  return (
    <div>
      <Header />
      <div className="flex flex-col xl:flex-row">
            <div className=" order-1 ml-14 lg:ml-20 xl:ml-32 xl:order-2 xl:w-4/12">
                <TagSelector />
            </div>
            <div className=" order-2 flex flex-col mb-40 ml-14 lg:ml-20 xl:ml-32 xl:order-1 xl:w-8/12">
                <BlogHeader />
                <FileUpload />
                <TextEditor />
                <ActionButtons />
            </div>
      </div>

      <Footer />
    </div>
  );
};

export default NewBlogMain;
