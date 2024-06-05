import React from "react";
import Image from "next/image";
import cardImage from "../public/digi.jpeg";
import proImage from "../public/profile.jpg";
import { FiMessageSquare } from "react-icons/fi";
import Link from "next/link";

const RelatedBlog = () => {
  return (
    <div className="flex justify-center">
      <div className="w-[380px] h-[580px] bg-white rounded-lg shadow-xl mx-2">
        <Image src={cardImage} alt="post" className="rounded-t-lg" />

        <div className="p-6 text-sm h-20 mb-2 pr-4">
          <h2 className="font-montserrat">Design Liberalized Exchanged Rate Management</h2>
        </div>

        <div className="pl-4 pr-4 flex">
          <div className="p-2 w-12 h-12 rounded-full overflow-hidden">
            <Link href="/">
              <Image
                src={proImage}
                alt="proImage"
                className="object-cover rounded-full w-full h-full hover:shadow-md transition-transform duration-300"
              />
            </Link>
          </div>

          <div className="flex justify-center items-center">
            <p className="text-xs text-gray-400 font-montserrat">by</p>
          </div>

          <div className="flex justify-center items-center p-2">
            <Link href="/">
              <p className="text-xs text-gray-600 font-montserrat font-bold hover:text-gray-400 transition-transform duration-300">
                Fred Boone
              </p>
            </Link>
          </div>

          <div className="flex justify-center items-center">
            <p className="text-xs text-gray-400 font-montserrat">|</p>
          </div>

          <div className="flex justify-center items-center p-2">
            <p className="text-xs text-gray-400 font-montserrat">Jan 10, 2020</p>
          </div>
        </div>

        <div className="flex p-4 gap-3">
          <div className="bg-gray-200 flex justify-center items-center rounded-2xl hover:bg-gray-300 transition-transform duration-300">
            <Link href="/">
              <div className="p-1.5 px-6">
                <div className="font-montserrat text-xs text-gray-500">UI/UX</div>
              </div>
            </Link>
          </div>

          <div className="bg-gray-200 flex justify-center items-center rounded-2xl hover:bg-gray-300 transition-transform duration-300">
            <Link href="/">
              <div className="p-1.5 px-6">
                <div className="font-montserrat text-xs text-gray-500 ">Development</div>
              </div>
            </Link>
          </div>
        </div>

        <div className="pl-4 pr-4 p-2">
          <p className="font-montserrat text-sm text-gray-500">
            A little personality goes a long way, especially on a business blog. So don’t be afraid
            to let loose.
          </p>
        </div>

        <div>
          <div className="border-b-2 p-2 mx-4"></div>
        </div>

        <div>
          <div className="flex justify-between pr-3">
            <div className="p-4 flex gap-2">
              <FiMessageSquare className="text-xl text-gray-500" />
              <p className="font-montserrat text-sm font-semibold text-gray-500 shrink-0">
                2.3k Likes
              </p>
            </div>

            <div className="flex justify-center items-center font-montserrat text-sm font-semibold text-gray-500 hover:text-blue transition-transform duration-300 hover:scale-110 hover:font-medium shrink-0">
              <Link href="/">Read More</Link>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default RelatedBlog;
