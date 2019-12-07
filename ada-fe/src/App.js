import React, {useState} from 'react';
import './App.css';
import { BrowserRouter as Router, Route} from "react-router-dom";

import Landing from "./components/layout/Landing";
import Chat from "./components/dashboard/Chat";
import Login from "./components/users/Login";
import Register from "./components/users/Register"
import Profile from "./components/dashboard/Profile";


function App() {
  const [token, setToken] = useState("");

  return (
    <Router>
      <Route exact strict path="/" component={Landing} />
      <Route exact path="/chat" component={() => <Chat setToken={setToken} />} />
      <Route exact path ="/register" component={Register} />
      <Route exact path ="/login" component={() => <Login setToken={setToken} />} />
      <Route exact path="/profile" component={() => <Profile token={token}/>} />
    </Router>
  );
}

export default App;
