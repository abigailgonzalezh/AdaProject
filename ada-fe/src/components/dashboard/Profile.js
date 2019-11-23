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
import Box from '@material-ui/core/Box';
import TextField from '@material-ui/core/TextField';
import Home from '@material-ui/icons/Home';




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
  textField: {
    marginTop: 12,
    width: 220,
    alignContent: 'center'
  },
  fab: {
    marginTop: 5,
    alignItems: 'center',
    width: 200,
  },
}));


export default function FullWidthGrid() {
  const classes = useStyles();

  return (
    <div className={classes.root}>
      <Grid container style={{height:"100vh"}}>
      
          <Grid className={classes.paper} justify="flex-start" item xs={12} lg={6} style={{backgroundColor: '#ffe0eb', color: 'black'}}>
          <Link to="/Chat">
            <Fab variant="rounded"  marginTop="12" style={{backgroundColor: '#f09eba'}}> <Home/> </Fab>
            </Link>
         <Container class="centered">
         <div>
             Introduce tus lugares frecuentes
            <div >
                    <TextField
                    id="outlined-basic"
                    className={classes.textField}
                    label="Nombre del lugar"
                    margin="normal"
                    variant="outlined"
                    />
                </div>
                <div >
                    <TextField
                    id="outlined-basic"
                    className={classes.textField}
                    label="Descripcion"
                    margin="normal"
                    variant="outlined"
                    />
                </div>
                <Fab variant="rounded"  className={classes.fab} style={{backgroundColor: '#f09eba'}}>Agregar</Fab>
            <br/>
            <br/>
            Ingresa a un grupo
            <div >
                    <TextField
                    id="outlined-basic"
                    className={classes.textField}
                    label="Ingresar a grupo"
                    margin="normal"
                    variant="outlined"
                    />
                </div>
                
                <Fab variant="rounded"  className={classes.fab} style={{backgroundColor: '#f09eba'}}>Ingresar</Fab>
            <br/>
            </div>
         </Container>
          </Grid>
 
      <Route>
        
          <Grid className={classes.paper} alignItems="center" justify="center" item xs={12} lg={6} style={{backgroundColor: '#fffcfd', color: 'black'}}>
          <Container class="centered">
         <div>
             Crea un grupo y comparte el numero para que tus amigos tambien ingresen a el
            <div >
                    <TextField
                    id="outlined-basic"
                    className={classes.textField}
                    label="Crear grupo"
                    margin="normal"
                    variant="outlined"
                    />
                </div>
                <Fab variant="rounded"  className={classes.fab} style={{backgroundColor: '#f09eba'}}>Crear</Fab>
            <br/>
            <br/>
            </div>
         </Container>
          </Grid>
          
        </Route>
      </Grid>
    </div>
  );
}