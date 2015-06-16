import React from 'react'
import IssuesList from './IssuesList'
import Modal from './Modal'
import clickFn from '../lib/clickFn'

require('./App.scss')

export default React.createClass({
  displayName: 'App',
  getInitialState () {
    return {}
  },
  issueClick (issue) {
    this.setState({ issue })
    window.scrollTo(0, 200)
  },
  render () {
    const issue = this.state.issue
    return (
      <div>
        {!issue && <IssuesList ref='issues' onIssueClick={this.issueClick} />}
        {issue && <Modal onClose={clickFn(this, 'issueClick', null)} issue={this.state.issue} />}
      </div>
    )
  }
})
