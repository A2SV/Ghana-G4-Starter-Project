import Link from "next/link";
import React from "react";

const Profile = () => {
  return (
    <div>
      <div className="font-pops w-36 text-2xl h-16 text-center px-16 font-medium">Profile</div>
      <div className="font-pops font-medium h-12 text-base flex border-b border-gray-200 mx-[64px]">
        <div className="w-56 h-8 ">
          <Link href={"info"}>Personal Information</Link>
        </div>
        <div className="w-56 h-8 ">
          <Link href={"#"}>My Blogs</Link>
        </div>
      </div>
    </div>
  );
};

export default Profile;
