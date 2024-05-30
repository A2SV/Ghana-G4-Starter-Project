"use client";
import React, { useState, FormEvent, ChangeEvent } from "react";
import { IoEye } from "react-icons/io5";

export default function LoginCard() {
  const [email, setEmail] = useState<string>("");
  const [password, setPassword] = useState<string>("");

  const handleSubmit = (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    console.log("Email:", email);
    console.log("Password:", password);
  };

  const handleEmailChange = (e: ChangeEvent<HTMLInputElement>) => {
    setEmail(e.target.value);
  };

  const handlePasswordChange = (e: ChangeEvent<HTMLInputElement>) => {
    setPassword(e.target.value);
  };

  return (
    <div className="h-[600px] w-full flex items-center justify-center">
      <div className="w-full ml-[30px] mr-[30px]  bg-white md:w-2/4 h-[400px] rounded-xl px-10 py-10">
        <h2 className="text-2xl text-text font-bold mb-6 text-left font-pops">Login</h2>
        <p className="text-sm text-text font-pops font-light my-10">
          Hey, Enter your details to sign in to your account{" "}
        </p>
        <form onSubmit={handleSubmit}>
          <div className="mb-4 font-pops">
            <input
              type="email"
              id="email"
              className="w-full px-3 py-2  bg-input text-sm   rounded-md focus:outline-none focus:border-blue-500"
              value={email}
              onChange={handleEmailChange}
              placeholder="Email address"
              required
            />
          </div>
          <div className="relative mb-6 font-pops flex flex-row">
            <input
              type="password"
              id="password"
              className="w-full px-3 py-2  bg-input text-sm  rounded-md focus:outline-none focus:border-blue-500 mb-7"
              value={password}
              onChange={handlePasswordChange}
              placeholder="Password"
              required
            />
            <span className="absolute right-3 top-5 transform -translate-y-1/2 text-eye">
              <IoEye />
            </span>
          </div>
          <button
            type="submit"
            className="w-full bg-btn text-white font-semibold text-sm py-2 font-pops rounded-md hover:bg-blue-600 transition duration-300"
          >
            Sign in
          </button>
        </form>
      </div>
    </div>
  );
}
