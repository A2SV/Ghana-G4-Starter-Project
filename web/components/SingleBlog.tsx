"use client";

import { useState, useEffect } from "react";
import Image from "next/image";
import SingleImage from "@/public/single_blog.jpg";
import ProfileImage from "@/public/profile_picture.png";
import { useGetBlogByIdQuery } from "../redux/blogApi";
import { useParams } from "next/navigation";
import { Tag } from "@/types/blogTypes";

export default function SingleBlog() {
  const params = useParams<{ id: string }>();

  const { data, error, isLoading } = useGetBlogByIdQuery({ blogId: params.id });
  console.log(data);
  const [blogData, setBlogData] = useState<any>({});
  useEffect(() => {
    if (data) {
      console.log(data);
      setBlogData(data);
    }
  }, [data]);

  if (isLoading) {
    return <div>Loading...</div>;
  }

  if (error) {
    return <div>Error loading blog data.</div>;
  }

  if (!data) {
    return <div>No blog data found.</div>;
  }

  return (
    <div className="flex flex-col justify-center items-center">
      <div className="ml-5 font-montserrat">
        <h1 className="top-270 font-imfell text-4xl left-565 pb-5">{blogData.title}</h1>
        <p className="flex justify-center items-center font-montserrat text-sm pt-4">
          {`${blogData?.tags?.map((tag: Tag) => tag.label).join(", ")} | 6 min Read`}
        </p>
      </div>
      <Image className="p-10 w-1586px h-792px" src={SingleImage} alt="single blog" />
      <Image className="pt-200 pb-200 w-20 h-20" src={ProfileImage} alt="profile picture" />
      <p className="font-imfell pt-3 pb-3 text-gray-600">
        {`${blogData?.userAccount?.firstName} ${blogData?.userAccount?.lastName} | Software engineer`}
      </p>
      <p className="text-blue mb-7">
        <a
          href={`mailto:${blogData?.userAccount?.email}`}
        >{`@ ${blogData?.userAccount?.firstName}_${blogData?.userAccount?.lastName}`}</a>
      </p>
      <div className="flex flex-col justify-center items-center font-montserrat text-sm text-gray-500">
        <p className="m-7 font-imfell text-black text-2xl flex justify-center">
          We know that data structure and algorithm can seem hard at first glance. And <br /> you
          may not be familiar with advanced algorithms, but there are simple steps you <br /> can
          follow to see outstanding results in a short period of time.
        </p>

        <p className="max-w-[70%]">
          <div dangerouslySetInnerHTML={{ __html: blogData.body }} />
        </p>
      </div>
    </div>
  );
}
