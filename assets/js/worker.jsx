import React from 'react';
import ReactDOM from 'react-dom';
import _ from 'lodash';
import Calendar from 'react-calendar';

import { connect } from 'react-redux';
import { Form, Button, Alert } from 'react-bootstrap';
import { Redirect } from 'react-router';

import { get_tasks } from './ajax';
import {submit_timesheet } from './ajax';

class Worker extends React.Component {
  constructor(props) {
    super(props);
    let arrayText = [];
    arrayText.push(<div key={0}>
        <Form.Group controlId={0}>
          <Form.Label>Select Task:</Form.Label>
            <Form.Control id={0} as="select" onChange={(ev) => this.jobsAdd(ev.target.value, ev.target.id)} >
              <JobList />
            </Form.Control>
        </Form.Group>
        <Form.Group controlId={0}>
            <Form.Label>Hours</Form.Label>
            <Form.Control id={0} type="number" min="1" max="8" onChange={(ev) => this.hoursAdd(ev.target.value, ev.target.id)}  />
        </Form.Group>
    </div>);
    this.state = {
        attributeForm: arrayText,
        redirect: null,
        date: null,
        total: 8,
        hours: [],
        i: 0,
        jobs: []
    };
    this.addAttributeForm = this.addAttributeForm.bind(this);
    this.hoursAdd = this.hoursAdd.bind(this);
    //this.jobsAdd = this.jobsAdd.bind(this);
  }

  redirect(path) {
    this.setState({
      redirect: path,
    });
  }

  onChange(date){
    this.setState({ date });
    let formatted_date = date.getDate() + "/" + (date.getMonth() + 1) + "/" + date.getFullYear();
    let newdate = formatted_date.toString();
    this.props.dispatch({
        type: 'CHANGE_NEW_TIMESHEET',
        data: {date: newdate},
    });
  }

  hoursAdd(data, key){
    let hours = this.state.hours;
    console.log(typeof(key));
    if(hours.length >= key){
      hours[key] = parseInt(data);
    }
    else{
      hours.push(parseInt(data));
    }
    let state1 = _.extend(this.state, {hours:hours});
    this.setState(state1);
    switch(key){
        case "0":
            console.log("enter");
            this.props.dispatch({
                type: 'CHANGE_NEW_TIMESHEET',
                data: {hr1: parseInt(data)},
            });
        case "1":
            this.props.dispatch({
                type: 'CHANGE_NEW_TIMESHEET',
                data: {hr2: parseInt(data)},
            });
            break;
        case "2":
            this.props.dispatch({
                type: 'CHANGE_NEW_TIMESHEET',
                data: {hr3: parseInt(data)},
            });

        case "3":
            this.props.dispatch({
                type: 'CHANGE_NEW_TIMESHEET',
                data: {hr4: parseInt(data)},
            });
            break;
        case "4":
            this.props.dispatch({
                type: 'CHANGE_NEW_TIMESHEET',
                data: {hr5: parseInt(data)},
            });

        case "5":
            this.props.dispatch({
                type: 'CHANGE_NEW_TIMESHEET',
                data: {hr6: parseInt(data)},
            });
            break;
        case "6":
            this.props.dispatch({
                type: 'CHANGE_NEW_TIMESHEET',
                data: {hr7: parseInt(data)},
            });

        case "7":
            this.props.dispatch({
                type: 'CHANGE_NEW_TIMESHEET',
                data: {hr8: parseInt(data)},
            });
            break;
        default:
            break;
    }
  }

  jobsAdd(data, key) {
    let jobs = this.state.jobs;
    if(jobs.length >= key){
      jobs[key] = parseInt(data);
    }
    else{
      jobs.push(parseInt(data));
    }
    let state1 = _.extend(this.state, {jobs:jobs});
    this.setState(state1);
    switch(key){
        case "0":
            this.props.dispatch({
                type: 'CHANGE_NEW_TIMESHEET',
                data: {jobid1: data},
            });
        case "1":
            this.props.dispatch({
                type: 'CHANGE_NEW_TIMESHEET',
                data: {jobid2: data},
            });
            break;
        case "2":
            this.props.dispatch({
                type: 'CHANGE_NEW_TIMESHEET',
                data: {jobid3: data},
            });

        case "3":
            this.props.dispatch({
                type: 'CHANGE_NEW_TIMESHEET',
                data: {jobid4: data},
            });
            break;
        case "4":
            this.props.dispatch({
                type: 'CHANGE_NEW_TIMESHEET',
                data: {jobid5: data},
            });

        case "5":
            this.props.dispatch({
                type: 'CHANGE_NEW_TIMESHEET',
                data: {jobid6: data},
            });
            break;
        case "6":
            this.props.dispatch({
                type: 'CHANGE_NEW_TIMESHEET',
                data: {jobid7: data},
            });

        case "7":
            this.props.dispatch({
                type: 'CHANGE_NEW_TIMESHEET',
                data: {jobid8: data},
            });
            break;
        default:
            break;
    }
  }

  addAttributeForm() {
    var array = this.state.attributeForm;
    let i = this.state.i;
    i = i + 1;
    let state1 = _.extend(this.state, {i:i});
    this.setState(state1);
    array.push(<div key={i}>
            <Form.Group controlId={i}>
              <Form.Label>Select Task:</Form.Label>
                <Form.Control id={i} as="select" onChange={(ev) => this.jobsAdd(ev.target.value, ev.target.id)}>
                  <JobList />
                </Form.Control>
            </Form.Group>
            <Form.Group controlId={i}>
                <Form.Label>Hours</Form.Label>
                <Form.Control id={i} type="number" min="1" max="8" onChange={(ev) => this.hoursAdd(ev.target.value, ev.target.id)} />
            </Form.Group>
        </div>
    );

    this.setState({
        attributeForm: array
    });
  }

  render() {
    if (this.state.redirect) {
      return <Redirect to={this.state.redirect} />
    }
    let formvalues = [];
    this.state.attributeForm.map(input => {
        formvalues.push(input);
    });
    let {email, password, errors} = this.props;
    let error_msg = null;
    if (errors) {
      error_msg = <Alert variant="danger">{ errors }</Alert>;
    }
    return (
        <div>
            <h1>Submit Timesheet</h1>
            
            <div className="row">
                <div className="col-10 col-md-10">
                    <Calendar
                    onChange={this.onChange.bind(this)}
                    value={this.state.date}
                    />
                </div>
            </div>
            {formvalues}
            <AddButton root={this} />
            <Form.Group controlId="submit">
                <Button variant="primary" onClick={() => submit_timesheet(this)}>
                Submit Timesheet
                </Button>
            </Form.Group>
        </div>
    );
  }
}

function AddButton(params){
    let root = params.root;
    let tasks = root.state.attributeForm;
    if(tasks.length < 8){
        return(
            <Form.Group controlId="submit">
                <Button variant="success" onClick={root.addAttributeForm}>
                +
                </Button>
            </Form.Group>
        );
    }
    else{
        return(
            <div>
            </div>
        );
    }
}


let JobList = connect(({jobs}) => ({jobs}))(({jobs}) => {
    if (jobs.size == 0) {
      get_tasks();
    }

    let jobsList = _.map([...jobs], ([_, job]) => {
        return <option key={job.id} value={job.jobid}>{job.jobid}</option>;
      });
       
      console.log(jobsList)
      return jobsList;
    });

function state2props(state) {
  return state.forms.new_timesheet;
}

export default connect(state2props)(Worker);