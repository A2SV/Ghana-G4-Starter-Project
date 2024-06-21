"use client";
import React, { useState } from "react";
import BlogHeader from "@/components/BlogHeader";
import FileUpload from "@/components/FileUpload";
import TagSelector from "@/components/TagSelector";
import ActionButtons from "@/components/ActionButtons";
import TextEditor from "@/components/TextEditor";
import Header from "@/components/Header";
import Footer from "@/components/Footer";
import { useCreateBlogMutation } from "@/redux/createBlogApi";
import { Tag } from "@/types/tagTypes";

const NewBlogMain: React.FC = () => {
  const [title, setTitle] = useState("");
  const [body, setBody] = useState("");
  const [tags, setTags] = useState<Tag[]>([]);
  const [createBlog, { isLoading, error, isSuccess }] = useCreateBlogMutation();

  const handleTitleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setTitle(e.target.value);
  };

  const handleBodyChange = (newBody: string) => {
    setBody(newBody);
  };

  const handleTagsChange = (selectedTags: Tag[]) => {
    setTags(selectedTags);
  };

  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    const formattedTags = tags.map((tag) => ({ tagId: tag.id }));
    try {
      const response = await createBlog({ title, body, tags: formattedTags }).unwrap();
      console.log("API response:", response);
    } catch (err) {
      console.error("API error:", err);
    }
  };

  const handleCancel = () => {
    setTitle("");
    setBody("");
    setTags([]);
  };

  return (
    <div>
      <Header />
      <div className="flex flex-col xl:flex-row">
        <div className="order-1 ml-14 pl-4 lg:border-l lg:border-gray-200 lg:ml-20 lg:pl-8 xl:ml-32 xl:pl-12 xl:order-2 xl:w-4/12">
          <TagSelector onChange={handleTagsChange} />
        </div>
        <div className=" order-2 flex flex-col mb-40 ml-14 lg:ml-20 xl:ml-32 xl:order-1 xl:w-8/12">
          <BlogHeader value={title} onChange={handleTitleChange} />
          <FileUpload />
          <TextEditor value={body} onChange={handleBodyChange} />
          <ActionButtons onSubmit={handleSubmit} isLoading={isLoading} onCancel={handleCancel} />
          {error && <div className="text-red-500">Error: {error.message}</div>}
          {isSuccess && <div className="text-green-500">Blog created successfully!</div>}
        </div>
      </div>

      <Footer />
    </div>
  );
};

export default NewBlogMain;
