import React from "react";

const ActionButtons: React.FC = () => {
  return (
    <div className="flex justify-end w-4/5 gap-6 mt-4 font-montserrat font-medium text-xs xl:w-full">
      <button className=" text-btn py-2 px-5 rounded hover:bg-btn hover:text-white">Cancel</button>
      <button className="bg-btn text-white py-2 px-5 rounded hover:bg-varietyBlue">
        Create Blog
      </button>
    </div>
  );
};

export default ActionButtons;
