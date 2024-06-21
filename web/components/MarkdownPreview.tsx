import React from "react";
import ReactMarkdown from "react-markdown";
import "github-markdown-css/github-markdown.css";

const MarkdownPreview: React.FC<{ content: string }> = ({ content }) => {
  return (
    <div className="markdown-body h-full break-words bg-blue p-4 pt-0 ">
      <ReactMarkdown>{content}</ReactMarkdown>
    </div>
  );
};

export default MarkdownPreview;
