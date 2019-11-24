import Reflux from 'reflux';
import Actions from './Actions';

class AppStore extends Reflux.Store {
  constructor() {
    super();
    this.state = { authenticated: false, email: "", token: "", messages: [] };
    this.listenables = Actions;
  }
  login(email, token) {
    this.setState({ authenticated: true, email: email, token: token });
  }
  logout() {
    this.setState({ authenticated: false, email: "", token: "" });
  }
  appendMessage(msg) {
    this.setState( { messages: [msg, ...this.state.messages] });
  }
}

export default AppStore;