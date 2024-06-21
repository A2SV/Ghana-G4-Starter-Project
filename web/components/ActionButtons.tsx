import React from "react";

interface ActionButtonsProps {
  onSubmit: (event: React.FormEvent<HTMLFormElement>) => Promise<void>;
  isLoading: boolean;
  onCancel: () => void;
}

const ActionButtons: React.FC<ActionButtonsProps> = ({ onSubmit, isLoading, onCancel }) => {
  return (
    <form
      onSubmit={onSubmit}
      className="flex justify-end w-4/5 gap-6 mt-4 font-montserrat font-medium text-xs xl:w-full"
    >
      <button
        type="button"
        className="text-btn py-2 px-5 rounded hover:bg-btn hover:text-white"
        onClick={onCancel}
      >
        Cancel
      </button>
      <button
        type="submit"
        className="bg-btn text-white py-2 px-5 rounded hover:bg-varietyBlue"
        disabled={isLoading}
      >
        {isLoading ? "Creating..." : "Create Blog"}
      </button>
    </form>
  );
};

export default ActionButtons;
