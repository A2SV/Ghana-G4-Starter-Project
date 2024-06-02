"use client";
import React, { useState, useEffect } from "react";
import MarkdownEditor from "@/components/MarkdownEditor";

const BlogCreatorPage: React.FC = () => {
  const [markdownContent, setMarkdownContent] = useState("");

  useEffect(() => {
    // Log the content to the console whenever it changes
    console.log(markdownContent);
  }, [markdownContent]);

  return (
    <div className="w-3/4 ml-5 font-pops break-before-all">
      <MarkdownEditor onChange={setMarkdownContent} />
    </div>
  );
};

export default BlogCreatorPage;
