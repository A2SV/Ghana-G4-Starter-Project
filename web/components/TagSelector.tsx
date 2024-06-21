"use client";
import React, { useState } from "react";
import { Tag } from "@/types/tagTypes";
import { useGetTagsQuery } from "@/redux/getTagsApi";

interface TagSelectorProps {
  onChange: (selectedTags: Tag[]) => void;
}

const TagSelector: React.FC<TagSelectorProps> = ({ onChange }) => {
  const [activeTags, setActiveTags] = useState<Tag[]>([]);
  const { data: tags, isLoading, isError } = useGetTagsQuery();

  const handleClick = (tag: Tag) => {
    let updatedTags;
    if (isActive(tag)) {
      updatedTags = activeTags.filter((t) => t.id !== tag.id);
    } else {
      updatedTags = [...activeTags, tag];
    }
    setActiveTags(updatedTags);
    onChange(updatedTags);
  };

  const isActive = (tag: Tag) => {
    return activeTags.some((t) => t.id === tag.id);
  };

  if (isLoading) {
    return <div>Loading tags...</div>;
  }

  if (isError) {
    return <div>Error loading tags</div>;
  }

  return (
    <div className="w-3/4">
      <p className="font-montserrat font-semibold mb-7">Select Tag</p>
      <div className="flex flex-wrap w-full gap-2 mb-4">
        {tags.map((tag: Tag) => (
          <button
            type="button"
            key={tag.id}
            onClick={() => handleClick(tag)}
            className={`font-medium font-montserrat text-sm py-1 px-3 rounded-full transition-colors duration-300 ${
              activeTags.includes(tag)
                ? " text-btn bg-white border-2 border-btn"
                : "bg-tag border border-transparent"
            } text-gray-800  hover:bg-btn  hover:text-white `}
          >
            {tag.label}
          </button>
        ))}
      </div>
    </div>
  );
};

export default TagSelector;
