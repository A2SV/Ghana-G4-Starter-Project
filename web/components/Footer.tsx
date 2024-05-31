import React from "react";
import Image from "next/image";
import Link from "next/link";
import FooterImage from "../public/climb.svg";
import { FaTwitter, FaFacebook, FaYoutube, FaLinkedin, FaInstagram } from "react-icons/fa6";

const Footer = () => {
  const links = [
    { title: "Home", link: "#" },
    { title: "Success Stories", link: "#" },
    { title: "About Us", link: "#" },
    { title: "Get Involved", link: "#" },
  ];
  const teams = [
    { title: "Board Members", link: "#" },
    { title: "Advisors/Mentors", link: "#" },
    { title: "Executive", link: "#" },
    { title: "Staffs", link: "#" },
  ];

  const blogs = [
    { title: "Recent Blog", link: "#" },
    { title: "New Blog", link: "#" },
  ];

  return (
    <div className="footer-main flex flex-col mt-[51px] mb-[56px] mx-4 sm:mx-[67px] ">
      <div className="footer-upper w-full lg:flex justify-between">
        <div className="upper-left w-full lg:w-[45%] flex flex-col lg:flex-row lg:justify-between items-center">
          <div className="image-side shrink-0">
            <Image src={FooterImage} alt="Elevate" />
          </div>

          <div className="text-button flex flex-col items-center lg:items-start ">
            <p className="font-montserrat">
              Get Involved in improving tech
              <br />
              Education in Africa!
            </p>
            <button className="bg-blue w-[170px] h-[40px] rounded-md font-montserrat my-8 text-white">
              <Link href="#" target="_blank">
                Support Us
              </Link>
            </button>
          </div>
        </div>

        <div className="upper-right lg:w-[45%] flex justify-between ">
          <div className="links flex flex-col text-start justify-between ">
            <p className="text-xs lg:text-base font-montserrat font-semibold">Links</p>

            {links.map((item, index) => (
              <a
                key={`link-${index}`}
                href={item.link}
                target="_blank"
                rel="noopener noreferrer"
                className="text-xs lg:text-base font-montserrat  font-extraThin my-3 hover:text-blue transition-transform duration-300 hover:scale-110 hover:font-medium"
              >
                {item.title}
              </a>
            ))}
          </div>
          <div className="teams flex flex-col text-start justify-between ">
            <p className="text-xs lg:text-base font-montserrat font-semibold">Teams</p>

            {teams.map((item, index) => (
              <a
                key={`teams-${index}`}
                href={item.link}
                target="_blank"
                rel="noopener noreferrer"
                className="text-xs lg:text-base font-montserrat font-extraThin my-3  hover:text-blue transition-transform duration-300 hover:scale-110 hover:font-medium"
              >
                {item.title}
              </a>
            ))}
          </div>
          <div className="blogs flex flex-col h-[60%] text-start justify-between ">
            <p className="text-xs lg:text-base font-montserrat font-semibold">Blogs</p>

            {blogs.map((item, index) => (
              <a
                key={`blogs-${index}`}
                href={item.link}
                target="_blank"
                rel="noopener noreferrer"
                className="text-xs lg:text-base font-montserrat font-extraThin my-3  hover:text-blue transition-transform duration-300 hover:scale-110 hover:font-medium"
              >
                {item.title}
              </a>
            ))}
          </div>
        </div>
      </div>

      <div className="footer-lower border-t-2 flex flex-col md:flex-row justify-between p-4 mt-10 ">
        <div className="lower-left md:order-1 order-2 mb-[14px] flex justify-center items-center">
          <p className="font-montserrat font-thin text-xs md:text-sm ">
            &copy; 2020 Africa to Silicon Valley, Inc. All rights reserved{" "}
          </p>
        </div>
        <div className="lower-right flex w-full sm:w-[25%] justify-evenly md:order-2 order-1 mb-[14px]">
          <Link href="https://twitter.com/A2_SV/status/1775188431489925631" target="_blank">
            <FaTwitter className="text-gray-500 md:text-2xl hover:text-blue" />
          </Link>
          <Link href="https://m.facebook.com/africatosiliconvalley/" target="_blank">
            <FaFacebook className="text-gray-500 md:text-2xl hover:text-blue" />
          </Link>
          <Link href="https://www.youtube.com/channel/UC70kFW6mFFGEjsucvNZk6-A" target="_blank">
            <FaYoutube className="text-gray-500 md:text-2xl hover:text-red-600" />
          </Link>
          <Link href="https://www.linkedin.com/company/a2sv" target="_blank">
            <FaLinkedin className="text-gray-500 md:text-2xl hover:text-blue" />
          </Link>
          <Link href="https://www.instagram.com/a2sv_org/?hl=en" target="_blank">
            <FaInstagram className="text-gray-500 md:text-2xl hover:text-orange-600" />
          </Link>
        </div>
      </div>
    </div>
  );
};

export default Footer;
