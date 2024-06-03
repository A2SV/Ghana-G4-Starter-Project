import React from "react";
import Image from "next/image";
import headerImage from "../public/header_image.jpg";
import blogImage from "../public/blog_image.png";

interface PostCardProps {
  author: string;
  date: string;
  title: string;
  content: string;
  tags: string[];
  role: string;
}

const PostCard: React.FC<PostCardProps> = ({ author, role, date, title, content, tags }) => {
  return (
    <div className="max-w-4xl mx-auto bg-white rounded-lg mb-6 overflow-hidden font-montserrat">
      <div className="p-6 flex items-center">
        <Image
          className="w-12 h-12 rounded-full object-cover mr-4"
          src={headerImage}
          alt="Profile image"
        />
        <div>
          <div className="flex items-center">
            <div className="font-bold text-lg">{author}</div>
            <span className="mx-2 text-gray-500 text-2xl font-bold">•</span>
            <div className="text-gray-400">{date}</div>
          </div>
          <div className="text-gray-400 text-sm">{role}</div>
        </div>
      </div>
      <div className="flex flex-col md:flex-row px-6 mt-0 w-full">
        <div className="md:w-2/3">
          <h3 className="text-xl font-bold mb-2">{title}</h3>
          <div><h3 className="text-xl font-bold mb-2">Tab System On React : 3 ways to do it.</h3></div>
          <p className="text-gray-400 mr-10 mb-5">{content}</p>
        </div>
        <div className="flex md:w-1/3 justify-end mt-0">
          <Image src={blogImage} alt="content" className="w-full h-auto" />
        </div>
      </div>
      <div className="flex flex-wrap space-x-2 px-10">
        {tags.map((tag) => (
          <span key={tag} className="px-3 mb-2 py-1 bg-gray-100 text-gray-400 rounded-full">
            {tag}
          </span>
        ))}
      </div>
    </div>
  );
};

export default PostCard;
