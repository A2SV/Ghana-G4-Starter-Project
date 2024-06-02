"use client";
// components/TagSelector.tsx
import React, { useState } from "react";

const tags = [
  "Development",
  "Sports",
  "Writing",
  "Self Improvement",
  "Technology",
  "Social",
  "Data Science",
  "Programming",
];

const TagSelector: React.FC = () => {
  // Initialize the activeTag state with the first tag by default
  const [activeTag, setActiveTag] = useState<string>(tags[0]);

  const handleClick = (tag: string) => {
    setActiveTag(tag);
  };

  return (
    <div className="w-3/4 ml-10">
      <p className="font-montserrat font-semibold mb-7">Select Tag</p>
      <div className="flex flex-wrap w-full gap-2 mb-4">
        {tags.map((tag) => (
          <button
            type="button"
            key={tag}
            onClick={() => handleClick(tag)}
            className={`font-medium font-montserrat text-sm py-1 px-3 rounded-full transition-colors duration-300 ${
              activeTag === tag
                ? " text-btn bg-white border-2 border-btn"
                : "bg-tag border border-transparent"
            } text-gray-800  hover:bg-btn  hover:text-white `}
          >
            {tag}
          </button>
        ))}
      </div>
    </div>
  );
};

export default TagSelector;
