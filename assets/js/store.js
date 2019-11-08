import { createStore, combineReducers } from 'redux';
import deepFreeze from 'deep-freeze-strict';

/* Structure of store data:
 * {
 *   forms: {
 *     new_photo: {...},
 *     edit_photo: {...},
 *     new_user: {...},
 *     edit_user: {...},
 *   },
 *   users: Map.new(
 *     1 => {id: 1, name: "Alice", email: "alice@example.com"},
 *     ...
 *   ),
 *   photos: Map.new(
 *     1 => {id: 1, data: "...", desc: "...", tags: [...]},
 *     ...
 *   ),
 * }
 */

function new_timesheet(st0 = {user_id: null, date: "", hr1: 0, hr2: 0, hr3: 0, hr4: 0, hr5: 0, hr6: 0, hr7: 0, hr8: 0, jobid1:null, jobid2: null, jobid3: null,
  jobid4: null, jobid5: null, jobid6: null, jobid7: null, jobid8: null, errors: null, status: "Pending"}, action) {
    let session0 = localStorage.getItem('session');
    if (session0) {
      session0 = JSON.parse(session0);
      st0 = Object.assign({}, st0, {user_id: session0.user_id});
    }
    switch (action.type) {
      case 'CHANGE_NEW_TIMESHEET':
        return Object.assign({}, st0, action.data);
      default:
        return st0;
  }
}

function approve_timesheet(st0 = {user_id: null, date: "", hr1: 0, hr2: 0, hr3: 0, hr4: 0, hr5: 0, hr6: 0, hr7: 0, hr8: 0, jobid1:null, jobid2: null, jobid3: null,
  jobid4: null, jobid5: null, jobid6: null, jobid7: null, jobid8: null, errors: null, status: "Pending"}, action) {
    switch (action.type) {
      case 'UPDATE_TIMESHEET':
        return Object.assign({}, st0, action.data);
      default:
        return st0;
  }
}

function login(st0 = {email: "", password: "", errors: null}, action) {
  switch(action.type) {
    case 'CHANGE_LOGIN':
      return Object.assign({}, st0, action.data);
    default:
      return st0;
  }
}

function forms(st0, action) {
  let reducer = combineReducers({
    new_timesheet,
    approve_timesheet,
    login,
  });
  return reducer(st0, action);
}

function users(st0 = new Map(), action) {
  return st0;
}

function jobs(st0 = new Map(), action) {
  switch (action.type) {
    case 'GET_JOBS':
      let st1 = new Map(st0);
      for (let job of action.data) {
        st1.set(job.id, job);
      }
      return st1;
    default:
      return st0;
  }
}

function timesheets(st0 = new Map(), action){
  let st1 = new Map(st0);
  switch(action.type){
    case 'ADD_TIMESHEET':
      for(let ts of action.data){
        st1.set(ts.id, ts);
      }
      return st1;
    case 'GET_TIMESHEETS':
      for(let ts of action.data){
        st1.set(ts.id, ts);
      }
      return st1;
    default:
      return st0;
  }
}

let session0 = localStorage.getItem('session');
if (session0) {
  session0 = JSON.parse(session0);
}

function session(st0 = session0, action) {
  switch (action.type) {
    case 'LOG_IN':
        //console.log("Session Log in:" + action.data);
      return action.data;
    case 'LOG_OUT':
      return null;
    default:
      return st0;
  }
}

function root_reducer(st0, action) {
  console.log("root reducer", st0, action);
  let reducer = combineReducers({
    forms,
    users,
    jobs,
    timesheets,
    session,
  });
  return deepFreeze(reducer(st0, action));
}

let store = createStore(root_reducer);
export default store;