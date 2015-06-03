import React from 'react'
import IssuesList from './IssuesList'

require('./App.scss')

export default class App extends React.Component {
  render () {
    return (
      <div>
        <IssuesList />
      </div>
    )
  }
}
