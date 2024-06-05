import React from "react";
import Image from "next/image";

const ProfileBlogsCard = () => {
  return (
    <div>
      <div className="md:w-[250px] w-[300px]  flex flex-col space-y-5 pb-[60px] shadow-sm">
        <Image src="/BlogImage.svg" width={250} height={150} alt="Blog Image" />
        <div className="pt-2 px-[10px]">
          <p className="text-[12px] text-[#5E5873]">Design Liberalized Exchange Rate Management</p>
          <div className="flex flex-row pt-2">
            <Image src="/Avatar.svg" width={20} height={20} className="rounded-lg" alt="avatar" />
            <p className="text-[#B9B9C3] text-[12px] px-2">by</p>
            <p className="text-[#6E6B7B] text-[14px]">
              <span>Fred Boone</span> |
            </p>
            <p className="text-[14px] text-[#B9B9C3] pl-2">Jan 10,2020</p>
          </div>

          <div className="flex flex-row pt-2 space-x-6  pb-[14px]">
            <button className="px-[12px] py-[6px] bg-[#F5F5F5] rounded-lg text-[8px] text-[#8E8E8E]">
              UI/UX
            </button>
            <button className="px-[12px] py-[6px] bg-[#F5F5F5] rounded-lg text-[8px] text-[#8E8E8E]">
              Development
            </button>
          </div>
          <p className="text-[10px] text-[#6E6B7B]">
            A little personality goes a long way, especially on a business blog. So don’t be afraid
            to let loose.
          </p>
          <div className="border-b border-[#EBE9F1] pt-[40px]">
             
          </div>
        </div>
      </div>
    </div>
  );
};

export default ProfileBlogsCard;
