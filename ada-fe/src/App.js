import React from 'react';
import logo from './logo.svg';
import './App.css';
import { BrowserRouter as Router, Route , Link } from "react-router-dom";

import Landing from "./components/layout/Landing";
import Chat from "./components/dashboard/Chat";
import Login from "./components/users/Login";
import Register from "./components/users/Register"


function App() {
  return (
    <Router>
      <Route exact strict path="/" component={Landing} />
      <Route exact path="/chat" component={Chat} />
      <Route exact path ="/register" component={Register} />
      <Route exact path ="/login" component={Login} />
    </Router>
  );
}

export default App;
