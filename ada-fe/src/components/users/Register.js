import React from 'react';
import Grid from '@material-ui/core/Grid';
import Container from '@material-ui/core/Container';
import { makeStyles } from '@material-ui/core/styles';
import TextField from '@material-ui/core/TextField';
import Fab from '@material-ui/core/Fab';

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
    width: 500,
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
        <Grid container style={{height:"100vh", alignItems:"center",backgroundColor: '#fffcfd'}}>
            <Container>
                <div>
                    <TextField
                    id="outlined-basic"
                    className={classes.textField}
                    label="Usuario"
                    margin="normal"
                    variant="outlined"
                    />
                </div>
                <div>
                    <TextField
                    id="outlined-basic"
                    className={classes.textField}
                    label="Contraseña"
                    margin="normal"
                    variant="outlined"
                    />
                </div>
                <div>
                    <TextField
                    id="outlined-basic"
                    className={classes.textField}
                    label="Repetir contraseña"
                    margin="normal"
                    variant="outlined"
                    />
                </div>
                    <Grid style={{alignItems:"center"}}>
                        <Fab variant="rounded"  className={classes.fab} style={{backgroundColor: '#f09eba'}}>Registrarse</Fab>
                    </Grid>
                </Container>
        </Grid>
    );
  }