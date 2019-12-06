import React, {useState} from 'react';
import Grid from '@material-ui/core/Grid';
import Container from '@material-ui/core/Container';
import { makeStyles } from '@material-ui/core/styles';
import TextField from '@material-ui/core/TextField';
import Fab from '@material-ui/core/Fab';
import { BrowserRouter as Route , useHistory,  useLocation } from "react-router-dom";
import './Login.css'

const useStyles = makeStyles(theme => ({
  container: {
    display: 'flex',
    flexWrap: 'wrap',
    alignContent: 'center'
  },
  paper: {
    padding: theme.spacing(1),
    textAlign: 'center',
  },
  textField: {
    marginTop: 12,
    width: 200,
  },
  fab: {
    marginTop: 12,
    alignItems: 'center',
    width: 200,
  },
}));

export default function Register() {
    const classes = useStyles();    
    let location = useLocation();
    let history = useHistory();
    const [username, setUsername] = useState("");
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    const [password_confirmation, setPassword_confirmation] = useState("");
    
    let { from } = location.state || { from: { pathname: "/" } };
    console.log(from);
    let registration = async () => {
      fetch("http://localhost:4000/api/registration", {
        method: "POST",
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            username: username,
            email: email,
            password: password,
            password_confirmation: password_confirmation
        })
      })
      .then( response => {
        if (!response.ok)
          throw new Error("error") 
        return response.json(); 
      }).then( json => {
        console.log( json.data ); 
        history.replace("/login");
      })
    } 

    return (
      <Route>
      <Grid container style={{height:"100vh",alignItems:"center",backgroundColor: '#fffcfd'}} class="centered">
          <Container class="centered" >
            <div class  >
              <div>
                  <TextField
                  id="outlined-basic"
                  className={classes.textField}
                  label="Usuario"
                  margin="normal"
                  variant="outlined"
                  value={username} onChange={ev => setUsername(ev.target.value)}
                  />
              </div>
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
              <div class>
                  <TextField
                  id="outlined-basic"
                  className={classes.textField}
                  label="Contraseña"
                  type="password"
                  margin="normal"
                  variant="outlined"
                  value={password} onChange={ev => setPassword(ev.target.value)}
                  />
              </div>
              <div class>
                  <TextField
                  id="outlined-basic"
                  className={classes.textField}
                  label="Confirmar contraseña"
                  type="password"
                  margin="normal"
                  variant="outlined"
                  value={password_confirmation} onChange={ev => setPassword_confirmation(ev.target.value)}
                  />
              </div>
                      <Fab variant="rounded"  className={classes.fab} style={{backgroundColor: '#f09eba'}} onClick={() => registration()}>Registrarse</Fab>
                  </div>
              </Container>
      </Grid>
      </Route>
  );
  }