import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Grid from '@material-ui/core/Grid';
import TextField from '@material-ui/core/TextField';
import Fab from '@material-ui/core/Fab';
import SendIcon from '@material-ui/icons/Send';



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
  container: {
    display: 'flex',
    flexWrap: 'wrap',
  },
  textField: {
    marginLeft: theme.spacing(1),
    marginRight: theme.spacing(1),
    width: 250,
  },
  fab: {
    margin: theme.spacing(1),
  },
  extendedIcon: {
    marginRight: theme.spacing(1),
  },
}));

export default function FullWidthGrid() {
  const classes = useStyles();

    return (
<div className={classes.root}>
      <Grid container style={{height:"100vh"}}>

          <Grid className={classes.paper} justify="flex-start" item xs={12} lg={6} style={{backgroundColor: '#ffe0eb', color: 'black'}}>

          </Grid>
        
          <Grid className={classes.paper} alignItems="center" justify="center" item xs={12} lg={6} style={{backgroundColor: '#fffcfd', color: 'black'}}>
          <br/>
          <div>
        <TextField
          id="standard-multiline-flexible"
          label="¿Qué le diras?"
          multiline
          rowsMax="4"
          className={classes.textField}
          margin="normal"
        />
                <Fab aria-label="like" className={classes.fab}>
        <SendIcon/>
      </Fab>
        </div>
        <div>

        </div>
            <br/>
          </Grid>
      </Grid>
    </div>
    );
  }