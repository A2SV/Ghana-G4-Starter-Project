"use client";
import React, { useState } from "react";
import SimpleMDE from "react-simplemde-editor";
import "easymde/dist/easymde.min.css";

const MarkdownEditor: React.FC<{ onChange: (value: string) => void }> = ({ onChange }) => {
  const [value, setValue] = useState("");

  const handleChange = (value: string) => {
    setValue(value);
    onChange(value);
  };

  return (
    <div className="markdown-editor ml-5 break-before-all">
      <SimpleMDE value={value} onChange={handleChange} />
    </div>
  );
};

export default MarkdownEditor;
