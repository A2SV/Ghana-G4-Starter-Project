"use client";
import React, { useState, FormEvent, ChangeEvent } from "react";

export default function SignupCard() {
  const [firstName, setFirstName] = useState<string>("");
  const [lastName, setLastName] = useState<string>("");
  const [email, setEmail] = useState<string>("");
  const [password, setPassword] = useState<string>("");

  const handleSubmit = (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    console.log("First Name:", firstName);
    console.log("Last Name:", lastName);
    console.log("Email:", email);
    console.log("Password:", password);
  };

  const handleFirstNameChange = (e: ChangeEvent<HTMLInputElement>) => {
    setFirstName(e.target.value);
  };

  const handleLastNameChange = (e: ChangeEvent<HTMLInputElement>) => {
    setLastName(e.target.value);
  };

  const handleEmailChange = (e: ChangeEvent<HTMLInputElement>) => {
    setEmail(e.target.value);
  };

  const handlePasswordChange = (e: ChangeEvent<HTMLInputElement>) => {
    setPassword(e.target.value);
  };

  return (
    <div className="min-h-screen min-w-full flex items-center justify-center">
      <div className=" min-w-1/2 bg-white w-2/4 h-1/6 rounded-xl px-10 py-10">
        <h2 className="text-2xl text-text font-bold mb-3 text-left font-pops">Sign up</h2>
        <p className="text-sm text-text font-pops mb-2 font-light">
          Hey, Enter your details to sign up{" "}
        </p>
        <form onSubmit={handleSubmit}>
          <div className="font-pops flex flex-row">
            <input
              type="text"
              id="first-name"
              className="w-full px-3 py-2 border bg-input text-sm mb-4 rounded-md focus:outline-none focus:border-blue-500"
              value={firstName}
              onChange={handleFirstNameChange}
              placeholder="First Name"
              required
            />
          </div>
          <div className="font-pops flex flex-row">
            <input
              type="text"
              id="last-name"
              className="w-full px-3 py-2 border bg-input text-sm mb-4 rounded-md focus:outline-none focus:border-blue-500"
              value={lastName}
              onChange={handleLastNameChange}
              placeholder="Last Name"
              required
            />
          </div>
          <div className="mb-4 font-pops">
            <input
              type="email"
              id="email"
              className="w-full px-3 py-2 border bg-input text-sm mb-4 rounded-md focus:outline-none focus:border-blue-500"
              value={email}
              onChange={handleEmailChange}
              placeholder="Email address"
              required
            />
          </div>
          <div className="relative mb-4 font-pops flex flex-row">
            <input
              type="password"
              id="password"
              className="w-full px-3 py-2 border bg-input text-sm rounded-md focus:outline-none focus:border-blue-500 mb-7"
              value={password}
              onChange={handlePasswordChange}
              placeholder="Password"
              required
            />
          </div>
          <button
            type="submit"
            className="w-full bg-btn text-white font-semibold text-sm py-2 font-pops rounded-md hover:bg-blue-600 transition duration-300"
          >
            Sign up
          </button>
        </form>
      </div>
    </div>
  );
}
