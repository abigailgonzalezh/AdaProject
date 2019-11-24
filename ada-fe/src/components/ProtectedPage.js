import React from 'react';
import Reflux from 'reflux';
import Actions from '../state_management/Actions';
import AppStore from '../state_management/AppStore';

export default class ProctectedPage extends Reflux.Component {
    constructor(props) {
      super(props);
      this.store = AppStore;
    }
  
    componentDidMount() {
        let that=this;
      fetch("http://localhost:4000/api/bookings", {
        method: "GET",
        headers: {
          'Authorization': `Bearer ${that.state.token}`
        },
      }).then( response => response.json()
      ).then( json => {
        Actions.appendMessage(json.msg);
      })
    }
    createMessageMarkup() {
      return {__html: this.state.messages};
    }
    render() {
      return (
        <div>
          Hola
          <div dangerouslySetInnerHTML={this.createMessageMarkup()} >
          </div>
        </div>
      )
    }
}