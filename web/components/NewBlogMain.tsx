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
      <div>
        <TagSelector />
      </div>
      <div className="flex flex-col">
        <BlogHeader />
        <FileUpload />
        <TextEditor />
        <ActionButtons />
      </div>

      <Footer />
    </div>
  );
};

export default NewBlogMain;
