export type Maybe<T> = T | null;
export type InputMaybe<T> = Maybe<T>;
export type Exact<T extends { [key: string]: unknown }> = { [K in keyof T]: T[K] };
export type MakeOptional<T, K extends keyof T> = Omit<T, K> & { [SubKey in K]?: Maybe<T[SubKey]> };
export type MakeMaybe<T, K extends keyof T> = Omit<T, K> & { [SubKey in K]: Maybe<T[SubKey]> };
export type MakeEmpty<T extends { [key: string]: unknown }, K extends keyof T> = { [_ in K]?: never };
export type Incremental<T> = T | { [P in keyof T]?: P extends ' $fragmentName' | '__typename' ? T[P] : never };
/** All built-in and custom scalars, mapped to their actual values */
export type Scalars = {
  ID: { input: string; output: string; }
  String: { input: string; output: string; }
  Boolean: { input: boolean; output: boolean; }
  Int: { input: number; output: number; }
  Float: { input: number; output: number; }
};

export type RootMutationType = {
  __typename?: 'RootMutationType';
  /** Login */
  login: UserAuth;
  /** Sign Up */
  signup: UserAuth;
};


export type RootMutationTypeLoginArgs = {
  password: Scalars['String']['input'];
  username: Scalars['String']['input'];
};


export type RootMutationTypeSignupArgs = {
  password: Scalars['String']['input'];
  username: Scalars['String']['input'];
};

export type RootQueryType = {
  __typename?: 'RootQueryType';
  /** Hello World */
  helloWorld?: Maybe<Scalars['String']['output']>;
  /** Get user info */
  user: User;
};


export type RootQueryTypeUserArgs = {
  id: Scalars['ID']['input'];
};

export type User = {
  __typename?: 'User';
  id: Scalars['ID']['output'];
  username: Scalars['String']['output'];
};

export type UserAuth = {
  __typename?: 'UserAuth';
  token: Scalars['String']['output'];
  user: User;
};
