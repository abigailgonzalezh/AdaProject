import React from 'react';
import './App.css';
import { BrowserRouter as Router, Route} from "react-router-dom";

import Landing from "./components/layout/Landing";
import Chat from "./components/dashboard/Chat";
import Login from "./components/users/Login";
import Register from "./components/users/Register"
import Profile from "./components/dashboard/Profile";


function App() {
  return (
    <Router>
      <Route exact strict path="/" component={Landing} />
      <Route exact path="/chat" component={Chat} />
      <Route exact path ="/register" component={Register} />
      <Route exact path ="/login" component={Login} />
      <Route exact path="/profile" component={Profile} />
    </Router>
  );
}

export default App;
