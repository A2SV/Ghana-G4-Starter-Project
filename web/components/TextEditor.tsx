"use client";
import MarkdownEditor from "@/components/MarkdownEditor";

interface TextEditorProps {
  value: string;
  onChange: (content: string) => void;
}

const BlogCreatorPage: React.FC<TextEditorProps> = ({ value, onChange }) => {
  return (
    <div className="w-3/4 font-pops break-before-all xl:w-full">
      <MarkdownEditor value={value} onChange={onChange} />
    </div>
  );
};

export default BlogCreatorPage;
