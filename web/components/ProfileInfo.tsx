import Link from "next/link";
import React from "react";
import Image from "next/image";
import ProfileImage from "../public/Ellipse 26.png";

const ProfileInfo = () => {
  return (
    <div>
      <div className="flex flex-col sm:flex-row border-b border-gray-200 mx-[64px] font-montserrat justify-between items-center">
        <div className="flex flex-col">
          <div className="font-semibold text-lg sm:text-xl pt-4 sm:pt-0 text-gray-600">Manage Personal Information</div>
          <div className="font-semibold text-sm text-gray-400">
            Add all the required information about yourself
          </div>
        </div>
        <div>
          <button className="bg-blue w-[170px] h-[40px] rounded-md font-montserrat my-6 text-white">
            <Link href="#" target="_blank">
              Save Changes
            </Link>
          </button>
        </div>
      </div>
      <div className="flex flex-col sm:flex-row mx-[64px] gap-4 sm:gap-40 text-sm h-36 sm:h-24 items-start sm:items-center border-b border-gray-200">
        <label htmlFor="first_name" className="text-sm font-medium text-gray-900">
          Name
        </label>
        <div className="flex flex-col sm:flex-row gap-4 sm:gap-12">
          <input
            type="text"
            id="first_name"
            className="bg-gray-50 w-52 h-9 border border-gray-300 text-gray-900 rounded-md focus:ring-blue-500 focus:border-blue-500 block pl-2"
            placeholder="Yididiya"
            required
          />
          <input
            type="text"
            id="last_name"
            className="bg-gray-50 w-52 h-9 border border-gray-300 text-gray-900 rounded-md focus:ring-blue-500 focus:border-blue-500 block pl-2"
            placeholder="Kebede"
            required
          />
        </div>
      </div>
      <div className="flex flex-col sm:flex-row mx-[64px] gap-4 sm:gap-40 text-sm h-24 sm:h-24 items-start sm:items-center border-b border-gray-200">
        <label htmlFor="email" className="text-sm font-medium text-gray-900">
          Email
        </label>
        <div className="flex flex-col sm:flex-row gap-4 sm:gap-12">
          <input
            type="text"
            id="email"
            className="bg-gray-50  w-52 sm:w-[466px] h-9 border border-gray-300 text-gray-900 rounded-md focus:ring-blue-500 focus:border-blue-500 block pl-2"
            placeholder="yididiyakebede@gmail.com"
            required
          />
        </div>
      </div>
      <div className="flex flex-col sm:flex-row mx-[64px] gap-4 sm:gap-32 h-64 text-sm items-start sm:items-center border-b border-gray-200">
        <label htmlFor="uploadFile1" className="text-sm font-medium text-gray-900">
          Your photo
        </label>
        <Image src={ProfileImage} alt="user profile picture" width={64} />
        <label className="text-gray-400 font-semibold text-base rounded w-80 max-w-md h-40 flex flex-col items-center justify-center cursor-pointer border-2 border-gray-300 font-pops">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            className="w-11 mb-2 fill-[#5956E9]"
            viewBox="0 0 32 32"
          >
            <path
              d="M23.75 11.044a7.99 7.99 0 0 0-15.5-.009A8 8 0 0 0 9 27h3a1 1 0 0 0 0-2H9a6 6 0 0 1-.035-12 1.038 1.038 0 0 0 1.1-.854 5.991 5.991 0 0 1 11.862 0A1.08 1.08 0 0 0 23 13a6 6 0 0 1 0 12h-3a1 1 0 0 0 0 2h3a8 8 0 0 0 .75-15.956z"
              data-original="#000000"
            />
            <path
              d="M20.293 19.707a1 1 0 0 0 1.414-1.414l-5-5a1 1 0 0 0-1.414 0l-5 5a1 1 0 0 0 1.414 1.414L15 16.414V29a1 1 0 0 0 2 0V16.414z"
              data-original="#000000"
            />
          </svg>
          <span>
            <span className="text-gray-500">
              <strong>Click to upload</strong>
            </span>{" "}
            or drag and drop
          </span>
          <input type="file" id="uploadFile1" className="hidden" />
          <p className="text-sm font-medium text-gray-400 mt-2 font-pops">
            SVG, PNG, JPG or GIF(max 800x400px)
          </p>
        </label>
      </div>
    </div>
  );
};

export default ProfileInfo;
