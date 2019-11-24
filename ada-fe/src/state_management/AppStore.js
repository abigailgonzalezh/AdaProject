import Reflux from 'reflux';
import Actions from './Actions';

class AppStore extends Reflux.Store {
  constructor() {
    super();
    this.state = { authenticated: false, username: "", token: "", messages: [] };
    this.listenables = Actions;
  }
  login(username, token) {
    this.setState({ authenticated: true, username: username, token: token });
  }
  logout() {
    this.setState({ authenticated: false, username: "", token: "" });
  }
  appendMessage(msg) {
    this.setState( { messages: [msg, ...this.state.messages] });
  }
}

export default AppStore;