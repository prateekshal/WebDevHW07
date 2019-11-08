import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter as Router, Switch, Route, NavLink, Link } from 'react-router-dom';
import { Navbar, Nav, Col } from 'react-bootstrap';
import { Provider, connect } from 'react-redux';

import Login from './login';
import Manager from './manager';
import Worker from './worker';
import WorkerView from './worker_view';

import store from './store';

export default function init_page(root) {
  let tree = (
    <Provider store={store}>
      <Page />
    </Provider>
  );
  ReactDOM.render(tree, root);
}

function Page(props) {
  return (
    <Router>
      <Navbar bg="dark" variant="dark">
        <Col md="8">
          <Nav>
            <Nav.Item>
              <NavLink to="/" exact activeClassName="active" className="nav-link">
                Home
              </NavLink>
            </Nav.Item>
          </Nav>
        </Col>
        <Col md="4">
          <Session />
        </Col>
      </Navbar>
      <Switch>
      <Route exact path="/">
          
        </Route>
        <Route exact path="/users/manager">
          <Manager />
        </Route>
        <Route exact path="/users/worker">
          <Worker />
        </Route>
        <Route exact path="/users/worker_view">
          <WorkerView />
        </Route>
        <Route exact path="/login">
          <Login />
        </Route>
      </Switch>
    </Router>
  );
}

let Session = connect(({session}) => ({session}))(({session, dispatch}) => {
  function logout(ev) {
    ev.preventDefault();
    localStorage.removeItem('session');
    dispatch({
      type: 'LOG_OUT',
    });
  }

  if (session) {
    if(session.user_manager){
      return(
        <Nav>
        <Nav.Item>
          <p className="text-light py-2">Manager: {session.user_name}</p>
        </Nav.Item>
        <Nav.Item>
          <NavLink to="/users/manager" exact activeClassName="active" className="nav-link">
            View Timesheets
          </NavLink>
        </Nav.Item>
        <Nav.Item>
          <NavLink to="/" exact activeClassName="active" className="nav-link" onClick={logout}>
              Logout
          </NavLink>
        </Nav.Item>
      </Nav>
    );
    }
    else{
      return (
        <Nav>
          <Nav.Item>
            <p className="text-light py-2">User: {session.user_name}</p>
          </Nav.Item>
          <Nav.Item>
            <NavLink to="/users/worker" exact activeClassName="active" className="nav-link">
              Submit Timesheet
            </NavLink>
          </Nav.Item>
          <Nav.Item>
            <NavLink to="/users/worker_view" exact activeClassName="active" className="nav-link">
              View Timesheet
            </NavLink>
          </Nav.Item>
          <Nav.Item>
            <NavLink to="/" exact activeClassName="active" className="nav-link" onClick={logout}>
              Logout
            </NavLink>
          </Nav.Item>
        </Nav>
      );
    }
  }
  else {
    return (
      <Nav>
        <Nav.Item>
          <NavLink to="/login" exact activeClassName="active" className="nav-link">
            Login
          </NavLink>
        </Nav.Item>
      </Nav>
    );
  }
});