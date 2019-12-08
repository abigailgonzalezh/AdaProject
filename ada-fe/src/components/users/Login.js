import React, {useState} from 'react';
import Grid from '@material-ui/core/Grid';
import Container from '@material-ui/core/Container';
import { makeStyles } from '@material-ui/core/styles';
import TextField from '@material-ui/core/TextField';
import Fab from '@material-ui/core/Fab';
import { BrowserRouter as Route , useHistory, useLocation } from "react-router-dom";
import './Login.css'
import Actions from '../../state_management/Actions';

const useStyles = makeStyles(theme => ({
  container: {
    display: 'flex',
    height: "100vh", 
    display: 'flex',
    justifycontent: 'center',
    alignitems: 'center'
  },
  paper: {
    padding: theme.spacing(1),
    textAlign: 'center',
  },
  textField: {
    marginTop: 12,
    width: 220,
    alignContent: 'center'
  },
  fab: {
    marginTop: 12,
    alignItems: 'center',
    width: 200,
  },
}));

function Login(props){
  const classes = useStyles();  
  let history = useHistory();
  let location = useLocation();
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  let { from } = location.state || { from: { pathname: "/" } };
  console.log(props);
  let handleAuthentication = async () => {
    fetch("http://localhost:4000/api/auth/identity/callback", {
      method: "POST",
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        user: {
          email: email,
          password: password
        }
      }) 
    })
    .then( response => {
      if (!response.ok){
        throw alert("Favor de ingresar datos validos") 
      }
      return response.json(); 
    }).then( json => {
      console.log( json.data );
      Actions.login(email, json.data.token );
      props.setToken(json.data.token);
      history.replace("/chat");
    }).catch(error => console.log(error));
  }

  return(
    <Route>
      <Grid container style={{height:"100vh",alignItems:"center",backgroundColor: '#fffcfd'}} class="centered">
        <Container class="centered" >
            <div>
              <div>
                <TextField
                id="outlined-basic"
                className={classes.textField}
                label="Correo"
                margin="normal"
                variant="outlined"
                value={email} onChange={ev => setEmail(ev.target.value)}
                />
              </div>
              <div>
                  <TextField
                  id="outlined-basic"
                  className={classes.textField}
                  type="password"
                  label="Contraseña"
                  margin="normal"
                  variant="outlined"
                  value={password} onChange={ev => setPassword(ev.target.value)}
                  />
              </div>
                <Fab variant="rounded" className={classes.fab} style={{backgroundColor: '#f09eba'}} onClick={() => handleAuthentication()}>Ingresar</Fab>
            </div>
          </Container>
        </Grid>
    </Route>
  );
}

export default Login;