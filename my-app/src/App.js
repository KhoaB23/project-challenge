import React from 'react';
import "./App.css";
import Campaign from "./component/campaign";
import { ChakraProvider } from '@chakra-ui/react';


import {
  ApolloClient,
  InMemoryCache,
  ApolloProvider,
  createHttpLink
} from '@apollo/client';

const httpLink = createHttpLink({
  uri: 'http://localhost:4000'
});

const client = new ApolloClient({
  uri: 'http://localhost:4000/graphiql',
  cache: new InMemoryCache()
});

function App() {
  return (
    <ApolloProvider client={client}>
      <ChakraProvider>
        <Campaign />
      </ChakraProvider>
    </ApolloProvider>
  );
}

export default App;
