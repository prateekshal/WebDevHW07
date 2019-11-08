import React from 'react';
import ReactDOM from 'react-dom';

import { connect } from 'react-redux';
import { Form, Button, Alert } from 'react-bootstrap';
import { Redirect } from 'react-router';

import { get_timesheets } from './ajax';
import { approve_timesheet } from './ajax';


class Manager extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
    };
  }

  render() {
    return(
      <table className="table table-striped">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">JobID1</th>
            <th scope="col">Hr1</th>
            <th scope="col">JobID2</th>
            <th scope="col">Hr2</th>
            <th scope="col">JobID3</th>
            <th scope="col">Hr3</th>
            <th scope="col">JobID4</th>
            <th scope="col">Hr4</th>
            <th scope="col">JobID5</th>
            <th scope="col">Hr5</th>
            <th scope="col">JobID6</th>
            <th scope="col">Hr6</th>
            <th scope="col">JobID7</th>
            <th scope="col">Hr7</th>
            <th scope="col">JobID8</th>
            <th scope="col">Hr8</th>
            <th scope="col">User ID</th>
            <th scope="col">Date</th>
            <th scope="col">Status</th>
          </tr>
        </thead>
        <tbody>
          <Timesheets root={this}/>
        </tbody>
      </table>
    );
  }
}

let Timesheets = connect(({timesheets}) => ({timesheets}))(({timesheets}) => {
  if (timesheets.size == 0) {
    get_timesheets();
  }

  let jobslist = _.map([...timesheets], ([_, timesheet]) => {
    if(timesheet.status == "Pending"){
      return(
        <tr key={timesheet.id}>
          <td>{timesheet.id}</td>
          <td>{timesheet.jobid1}</td>
          <td>{timesheet.hr1}</td>
          <td>{timesheet.jobid2}</td>
          <td>{timesheet.hr2}</td>
          <td>{timesheet.jobid3}</td>
          <td>{timesheet.hr3}</td>
          <td>{timesheet.jobid4}</td>
          <td>{timesheet.hr4}</td>
          <td>{timesheet.jobid5}</td>
          <td>{timesheet.hr5}</td>
          <td>{timesheet.jobid6}</td>
          <td>{timesheet.hr6}</td>
          <td>{timesheet.jobid7}</td>
          <td>{timesheet.hr7}</td>
          <td>{timesheet.jobid8}</td>
          <td>{timesheet.hr8}</td>
          <td>{timesheet.user_id}</td>
          <td>{timesheet.date}</td>
          <td>{timesheet.status}</td>
          <td><Form.Group controlId="submit">
                <Button variant="success">
                Approve
                </Button>
            </Form.Group>
          </td>
          <td><Form.Group controlId="submit">
                <Button variant="danger">
                Disapprove
                </Button>
            </Form.Group></td>
    </tr>
      );
    }
    else{
    return <tr>
      <td>{timesheet.id}</td>
      <td>{timesheet.jobid1}</td>
      <td>{timesheet.hr1}</td>
      <td>{timesheet.jobid2}</td>
      <td>{timesheet.hr2}</td>
      <td>{timesheet.jobid3}</td>
      <td>{timesheet.hr3}</td>
      <td>{timesheet.jobid4}</td>
      <td>{timesheet.hr4}</td>
      <td>{timesheet.jobid5}</td>
      <td>{timesheet.hr5}</td>
      <td>{timesheet.jobid6}</td>
      <td>{timesheet.hr6}</td>
      <td>{timesheet.jobid7}</td>
      <td>{timesheet.hr7}</td>
      <td>{timesheet.jobid8}</td>
      <td>{timesheet.hr8}</td>
      <td>{timesheet.user_id}</td>
      <td>{timesheet.date}</td>
      <td>{timesheet.status}</td>
    </tr>;
    }});


  return (
        jobslist
  );
});

function state2props(state) {
  return state.timesheet;
}

export default connect(state2props)(Manager);