import React from 'react';
import logo from './logo.svg';
import './App.css';
import { BrowserRouter as Router, Route , Link } from "react-router-dom";

import Landing from "./components/layout/Landing";
import Chat from "./components/dashboard/Chat";


function App() {
  return (
    <Router>
      <Route exact strict path="/" component={Landing} />
      <Route exact path="/chat" component={Chat} />
    </Router>
  );
}

export default App;
