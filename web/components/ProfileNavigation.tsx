import React from "react";
import Link from "next/link";

const ProfileNavigation = () => {
  return (
    <div className="px-[30px]">
      <div>
        <h1 className="text-[18px] pb-4 pt-0 font-bold">Profile</h1>
        <div className="flex flex-row space-x-14">
          <h2 className="text-sm">
            <Link href="/profile/info">Personal Information</Link>
          </h2>
          <h2 className="text-sm text-[#264FAD] border-b-4 pb-3 border-[#264FAD] font-bold">
            <Link href="/profile/myblogs">My Blogs</Link>
          </h2>
        </div>
      </div>
    </div>
  );
};

export default ProfileNavigation;
