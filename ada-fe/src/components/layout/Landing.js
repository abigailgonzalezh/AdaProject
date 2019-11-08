import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import purple from '@material-ui/core/colors/purple';
import Contact from '@material-ui/icons/ChildCareOutlined';
import Eye from '@material-ui/icons/VisibilityOutlined';
import Heart from '@material-ui/icons/FavoriteBorder';

const accent = purple['A200'];
const useStyles = makeStyles(theme => ({
  root: {
    flexGrow: 1,
  },
  paper: {
    padding: theme.spacing(2),
    textAlign: 'center',
    color: theme.palette.text.secondary,
  },
}));

export default function FullWidthGrid() {
  const classes = useStyles();

  return (
    <div className={classes.root}>
      <Grid container spacing={3}>
          <Grid justify="flex-start" item xs={12} lg={6} style={{backgroundColor: '#f8bbd0', color: 'black'}}>
            <br/>
            <br/>
            <br/>
            <br/>
            <div><Contact/>ContactlessiconAvisa a tus contactos</div>
            <br/>
            <div><Eye/>Que alguien sepa de ti</div>
            <br/>
            <div><Heart/>Sal sin miedo </div>
          </Grid>


          <Grid justify="flex-start" item xs={12} lg={6} style={{backgroundColor: 'white', color: 'black'}}>
            adios
          </Grid>

      </Grid>
    </div>
  );
}