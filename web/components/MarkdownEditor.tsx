"use client";
import React from "react";
import SimpleMDE from "react-simplemde-editor";
import "easymde/dist/easymde.min.css";

interface MarkdownEditorProps {
  value: string;
  onChange: (content: string) => void;
}

const MarkdownEditor: React.FC<MarkdownEditorProps> = ({ value, onChange }) => {
  const handleContentChange = (value: string) => {
    onChange(value);
  };

  return (
    <div className="markdown-editor break-before-all">
      <SimpleMDE value={value} onChange={handleContentChange} />
    </div>
  );
};

export default MarkdownEditor;
