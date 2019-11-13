import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import purple from '@material-ui/core/colors/purple';
import Contact from '@material-ui/icons/ChildCareOutlined';
import Eye from '@material-ui/icons/VisibilityOutlined';
import Heart from '@material-ui/icons/FavoriteBorder';
import Fab from '@material-ui/core/Fab';
import { BrowserRouter as Router, Route , Link, Redirect } from "react-router-dom";
import { Container } from '@material-ui/core';


const accent = purple['A200'];
const useStyles = makeStyles(theme => ({
  root: {
    flexGrow: 1,
  },
  paper: {
    textAlign: 'center',
    width: '50%', 
    color: theme.palette.text.secondary,
  },
  logg:{
    width:'100%',
  },
}));


export default function FullWidthGrid() {
  const classes = useStyles();

  return (
    <div className={classes.root}>
      <Grid container >

          <Grid className={classes.paper} justify="flex-start" item xs={12} lg={6} style={{backgroundColor: '#ffe0eb', color: 'black',height:"100vh"}}>
            <br/>
            <br/>
            <br/>
            <br/>
            <div><Contact/>  Avisa a tus contactos</div>
            <br/>
            <div><Eye/>  Que alguien sepa de ti</div>
            <br/>
            <div><Heart/>  Sal sin miedo </div>
          </Grid>

      <Route>
        
          <Grid className={classes.paper} alignItems="center" justify="center" item xs={12} lg={6} style={{backgroundColor: '#fffcfd', color: 'black',height:"100vh"}}>
          <Container centered>
          <br/>
            <br/>
            <br/>
            <br/>
            <Link to="/Login">
            <Fab variant="rounded"  className={classes.fab} style={{backgroundColor: '#f09eba'}}>Iniciar sesion</Fab>
            </Link>
            <br/>
            <br/>
            <Fab variant="rounded"  className={classes.fab} style={{backgroundColor: '#f09eba'}}>Registrarse</Fab>
            <br/>
            </Container >
          </Grid>
          
        </Route>
      </Grid>
    </div>
  );
}