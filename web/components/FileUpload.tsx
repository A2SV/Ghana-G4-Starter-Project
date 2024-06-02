import React from "react";
import Image from "next/image";
import UploadImage from "../public/upload_file.png";
const FileUpload: React.FC = () => {
  return (
    <div className="flex flex-col items-center justify-center w-3/4  bg-fileUpload  border-2  border-gray-300 rounded-md ml-10 mb-4">
      <Image
        src={UploadImage}
        alt="Upload Image"
        className=" h-auto w-3/4 mb-2"
        objectFit="cover"
      />
      <div className="flex flex-row h-9 justify-center items-center">
        <p className="mr-2 text-sm font-montserrat">Please, </p>
        <label className="inline-flex items-center px-4 py-2 bg-white font-montserrat text-sm text-gray-700 rounded-md cursor-pointer  hover:bg-slate-200">
          Upload File
          <input type="file" className="hidden" />
        </label>
      </div>
    </div>
  );
};

export default FileUpload;
