import Link from "next/link";
import React from "react";
import headerImage from "../public/header_image.jpg";
import A2SVImage from "../public/Group 25.png";
import Image from "next/image";

const Header = () => {
  return (
    <div className="h-32 flex justify-between items-center px-4  font-sans">
      <div>
        <Link href={"/"}>
          <div>
            <Image className="w-32" src={A2SVImage} alt="A2SV Logo" />
          </div>
        </Link>
      </div>
      <div className="flex w-48 text-xl font-bold justify-between text-gray-500">
        <Link className="text-blue hidden md:block no-underline" href={"/"}>
          Blog
        </Link>
        <Link className="hidden md:block no-underline" href={"/profile/info"}>
          Profile
        </Link>
      </div>
      <Link href="#">
        <div className="relative">
          <Image width={40} className="rounded-full" src={headerImage} alt="Profile image" />
        </div>
      </Link>
    </div>
  );
};

export default Header;
