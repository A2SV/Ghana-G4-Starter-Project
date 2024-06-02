import React from "react";

const BlogHeader: React.FC = () => {
  return (
    <div className="flex h-20 3/4 justify-center content-center ml-6 mb-6">
      <span className=" w-0.5 h-2/5 ml-5 my-auto bg-btn"></span>
      <input
        type="text"
        placeholder="Enter the title of the blog"
        className="w-full p-2 font-imCanon text-blog text-2xl border-gray-300 focus:outline-none focus:border-blue-500"
      />
    </div>
  );
};

export default BlogHeader;
