"use client";
import Link from "next/link";
import React from "react";
import A2SVImage from "../public/Group 25.png";
import AvatarImage from "@/public/avatarimage.jpg";
import Image from "next/image";
import { signOut, useSession } from "next-auth/react";
import { Avatar, Dropdown } from "flowbite-react";

const Header = () => {
  const { data: session } = useSession();
  const userIsLoggedIn = !!session;
  const handleSignout = async () => {
    await signOut();
  };
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
          Blogs
        </Link>
        <Link className="hidden md:block no-underline" href={"/profile/info"}>
          Profile
        </Link>
      </div>
      {userIsLoggedIn ? (
        <Link href="#">
          <div className="w-[70px] h-[70px]">
            <Dropdown
              label={<Avatar alt="User settings" img={AvatarImage.src} rounded />}
              arrowIcon={false}
              inline
            >
              <Dropdown.Header>
                <span className="block text-sm">
                  {session?.user?.firstName} {session?.user?.lastName}
                </span>
                <span className="block truncate text-sm font-medium">{session?.user?.email}</span>
              </Dropdown.Header>
              <Dropdown.Divider />
              <Dropdown.Item>
                <div onClick={handleSignout}>Sign out</div>
              </Dropdown.Item>
            </Dropdown>
          </div>
        </Link>
      ) : (
        <div>
          <Link href="/login">
            <button className="bg-blue text-white px-4 py-2 rounded-md">Login</button>
          </Link>
        </div>
      )}
    </div>
  );
};

export default Header;
