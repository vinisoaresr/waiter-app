import React from 'react';
import { Header } from './components/Header/Header';
import { Orders } from './components/Orders/Orders';
import { GlobalStyles } from './styles/GlobalStyles';

function App() {

  return (
    <>
      <GlobalStyles />
      <Header/>
      <Orders/>
    </>
  );
}

export default App;
