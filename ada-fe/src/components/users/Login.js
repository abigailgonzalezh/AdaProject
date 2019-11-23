import React from 'react';
import Grid from '@material-ui/core/Grid';
import Container from '@material-ui/core/Container';
import { makeStyles } from '@material-ui/core/styles';
import TextField from '@material-ui/core/TextField';
import Fab from '@material-ui/core/Fab';
import { BrowserRouter as Router, Route , Link, Redirect } from "react-router-dom";
import './Login.css'

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

export default function FullWidthGrid() {
    const classes = useStyles();    


    return (
        <Route>
        <Grid container style={{height:"100vh",alignItems:"center",backgroundColor: '#fffcfd'}} class="centered">
            <Container class="centered" >
              <div class  >
                <div >
                    <TextField
                    id="outlined-basic"
                    className={classes.textField}
                    label="Usuario"
                    margin="normal"
                    variant="outlined"
                    />
                </div>
                <div class>
                    <TextField
                    id="outlined-basic"
                    className={classes.textField}
                    label="Contraseña"
                    margin="normal"
                    variant="outlined"
                    />
                </div>
                <Link to="/chat">
                        <Fab variant="rounded"  className={classes.fab} style={{backgroundColor: '#f09eba'}}>Ingresar</Fab>
                    </Link>
                    </div>
                </Container>
        </Grid>
        </Route>
    );
  }