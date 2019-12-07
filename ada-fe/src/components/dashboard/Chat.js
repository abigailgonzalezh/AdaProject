import React, { Component, useState } from 'react';
import PropTypes from 'prop-types';
import ChatBot from 'react-simple-chatbot';
import { ThemeProvider } from 'styled-components';
import Grid from '@material-ui/core/Grid';
import Fab from '@material-ui/core/Fab';
import Account from '@material-ui/icons/AccountCircle';
import { BrowserRouter as Link, } from "react-router-dom";
import Container from '@material-ui/core/Container';
class Review extends Component {
  constructor(props) {
    super(props);
    this.state = {
      lugar: '',
      tiempo: '',
    };
  }
  componentWillMount() {
    const { steps } = this.props;
    const { lugar, tiempo} = steps;
    this.setState({ lugar, tiempo});
  }
   render() {
    const { lugar, tiempo} = this.state;
    return (
      <div style={{ width: '100%' }}>
        <h3>informacion</h3>
        <table>
          <tbody>
            <tr>
              <td>Lugar:</td>
              <td>{lugar.value}</td>
            </tr>
            <tr>
              <td>Tiempo:</td>
              <td>{tiempo.message}</td>
            </tr>
          </tbody>
        </table>
      </div>
    );
  }
}
Review.propTypes = {
  steps: PropTypes.object,
};
Review.defaultProps = {
  steps: undefined,
};
class Chat extends Component {
  constructor(props) {
    super(props);
    this.delay = 3000;
    this.state = {loaded: false, options: []};
  }
  componentWillMount(props) {
    console.log(`El token es ${this.props.token}`)
    fetch("http://localhost:4000/api/places/", {
      method: "GET",
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${this.props.token}`
      }
    }
    ).then(res => res.json()
    ).then(res => {
      console.log(res);
      this.setState({loaded:true, options: res.names.map(p => ({ value: p, label: p, trigger: '3'}))
      })
    });
  }
  render() {
    const theme = {
      background: '#F5F8FB',
      headerBgColor: '#A288E3',
      headerFontColor: '#fff',
      headerFontSize: '15px',
      botBubbleColor: '#999AC6',
      botFontColor: '#fff',
      userBubbleColor: '#fff',
      userFontColor: '#4A4A4A',
    };
    const that = this;
    return (
      <div>
        <Grid container style={{height:"100vh"}}>
        <Grid textAlign="center" width="50%" justify="flex-start" item xs={12} lg={6} style={{backgroundColor: '#FFE0EB', color: 'black'}}>
        <div class="centered" style={{display:'flex'}}>
        <div style={{width:'80%'}}>
        <ThemeProvider theme={theme}>
        {
        this.state.loaded ? (<ChatBot headerTitle="Ada"
     speechSynthesis={{ enable: true, lang: 'sp' }}
        steps={[
          {
            id: '1',
            message: 'A que lugar vas?',
            trigger: 'lugar'
          },
          {
            id: 'lugar',
            options: this.state.options
          },
          {
            id: '3',
            message: 'Cuanto tiempo vas a tardar?',
            trigger: 'tiempo',
          },
          {
            id: 'tiempo',
            options: [
              { value: '60000', label: '1 min', trigger: '7' },
              { value: '900000', label: '15 min', trigger: '7' },
              { value: '1800000', label: '30 min', trigger: '7' },
              { value: '3600000', label: '1 hora', trigger: '7' },
              { value: '7200000', label: '2 horas', trigger: '7' },
            ],
          },
          {
            id: '7',
            message: 'Excelente!, Revisemos la informacion',
            trigger: 'review',
          },
          {
            id: 'review',
            component: <Review />,
            asMessage: true,
            trigger: 'update',
          },
          {
            id: 'update',
            message: 'Quieres cambiar algun dato?',
            trigger: 'update-question',
          },
          {
            id: 'update-question',
            options: [
              { value: 'si', label: 'Si', trigger: 'update-yes' },
              { value: 'no', label: 'No', trigger: 'buen-viaje' },
            ],
          },
          {
            id: 'update-yes',
            message: 'Que deseas cambiar?',
            trigger: 'update-fields',
          },
          {
            id: 'update-fields',
            options: [
              { value: 'lugar', label: 'Lugar', trigger: 'update-lugar' },
              { value: 'tiempo', label: 'Tiempo', trigger: 'update-tiempo' },
            ],
          },
          {
            id: 'update-lugar',
            update: 'lugar',
            trigger: '7',
          },
          {
            id: 'update-tiempo',
            update: 'tiempo',
            trigger: '7',
          },
          {
            id: 'buen-viaje',
            message: 'buen viaje',
            trigger: ({value, steps}) => {
              console.log("value", value);
              console.log("steps", steps);
              // steps.tiempo.value === "60000"
              // that.setState({delay: steps.tiempo.value});
              return `wait-${steps.tiempo.value}`;
            }
          },
          {
            id: 'wait-60000',
            message: 'llegaste?',
            delay: 600, //cambiar tiempo al final
            trigger: 'llegaste',
          },
          {
            id: 'wait-900000',
            message: 'llegaste?',
            delay: 900000,
            trigger: 'llegaste',
          },
          {
            id: 'wait-1800000',
            message: 'llegaste?',
            delay: 1800000,
            trigger: 'llegaste',
          },
          {
            id: 'wait-3600000',
            message: 'llegaste?',
            delay: 3600000,
            trigger: 'llegaste',
          },
          {
            id: 'wait-7200000',
            message: 'llegaste?',
            delay: 7200000,
            trigger: 'llegaste',
          },
          {
            id: 'llegaste',
            options: [
              { value: 'si', label: 'Si', trigger: 'opciones' },
              { value: 'no', label: 'No', trigger: 'mas-tiempo' },
            ]
          },
          {
            id: 'opciones',
            options: [
              { value: 'Volvere a viajar', label: 'Volvere a viajar', trigger: '1' },
              { value: 'Deseo terminar la conversacion', label: 'Deseo terminar la conversacion', trigger: 'end-message' },
            ]
          },
          {
            id: 'mas-tiempo',
            message: 'Te esperare otros 30 min',
            trigger: 'wait-1800000'
          },
          {
            id: 'end-message',
            message: 'Espero tu experiencia haya sido grata. Nos vemos pronto!',
            end: true,
          },
        ]}/>
        ): null
      }
      </ThemeProvider>
      </div>
      </div>
      </Grid>
      <Grid textAlign="center" width="50%" justify="flex-start" item xs={12} lg={6} style={{backgroundColor: '#FFFCFD', color: 'black'}}>
      <Container class="centered">
          <div>
            <div>
            <Link to="/profile">
            <Fab variant="rounded"  marginTop="12"alignItems="center"style={{backgroundColor: '#F09EBA'}}> <Account/> </Fab>
            </Link>
            </div>
            <br/>
            <br/>
            <Link to="/">
            <Fab variant="rounded" marginTop="12" alignItems="center" width="200" style={{backgroundColor: '#F09EBA'}}>Cerrar sesion</Fab>
            <br/>
            </Link>
            </div>
            </Container >
      </Grid>
      </Grid>
      </div>
    );
  }
}
export default Chat;