export interface UserAccount {
  id: number;
  firstName: string;
  lastName: string;
  email: string;
}
export interface Tag {
  id: number;
  label: string;
  description: string;
}
export interface BlogPost {
  id: number;
  title: string;
  tags: Tag[];
  userAccount: UserAccount;
  body: string;
  createdDateTime: string;
}
