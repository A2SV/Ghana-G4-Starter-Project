import React from "react";
import RelatedBlog from "@/components/RelatedBlog";

const CardsContainer = () => {
  return (
    <div data-testid="parent-component" className="w-[85%] mx-auto">
      <div className="md:p-4 md:pl-7 md:mx-4 flex justify-center p-2 md:justify-start">
        <h1 className="font-montserrat font-bold">Related Blogs</h1>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 justify-center items-center gap-8">
        <RelatedBlog />
        <RelatedBlog />
        <RelatedBlog />
      </div>
    </div>
  );
};

export default CardsContainer;
