import React from "react";

const ActionButtons: React.FC = () => {
  return (
    <div className="flex justify-end w-3/4 gap-6 mx-auto mt-4 font-montserrat font-medium text-xs ">
      <button className=" text-btn py-2 px-5 rounded hover:bg-btn hover:text-white">Cancel</button>
      <button className="bg-btn text-white py-2 px-5 rounded hover:bg-varietyBlue">
        Create Blog
      </button>
    </div>
  );
};

export default ActionButtons;
