import { Tag } from "./tagTypes";

export interface UserAccount {
  id?: number;
  firstName?: string;
  lastName?: string;
  email?: string;
  createdDateTime?: string;
}

export interface Blog {
  id?: number;
  title?: string;
  body?: string;
  createdDateTime?: string;
  userAccount?: UserAccount;
  tags?: Tag;
}
