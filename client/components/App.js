import React from 'react'
import IssuesList from './IssuesList'
import Modal from './Modal'
import clickFn from '../lib/clickFn'

require('./App.scss')

export default class App extends React.Component {
  static get displayName () { return 'App' }

  constructor (props) {
    super(props)
    this.state = {}
  }

  issueClick (issue) {
    this.setState({ issue })
  }

  render () {
    const issue = this.state.issue
    return (
      <div>
        {!issue && <IssuesList onIssueClick={this.issueClick.bind(this)} />}
        {issue && <Modal onClose={clickFn(this, 'issueClick', null)} issue={this.state.issue} />}
      </div>
    )
  }
}
