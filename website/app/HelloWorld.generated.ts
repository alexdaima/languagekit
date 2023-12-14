import * as Types from './types.generated';

import { TypedDocumentNode as DocumentNode } from '@graphql-typed-document-node/core';
export type HelloWorldQueryVariables = Types.Exact<{ [key: string]: never; }>;


export type HelloWorldQuery = { __typename?: 'RootQueryType', helloWorld?: string | null };


export const HelloWorldDocument = {"kind":"Document","definitions":[{"kind":"OperationDefinition","operation":"query","name":{"kind":"Name","value":"HelloWorld"},"selectionSet":{"kind":"SelectionSet","selections":[{"kind":"Field","name":{"kind":"Name","value":"helloWorld"}}]}}]} as unknown as DocumentNode<HelloWorldQuery, HelloWorldQueryVariables>;