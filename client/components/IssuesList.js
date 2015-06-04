import React, { Component } from 'react'
import { issues, categories } from '../data'
import clickFn from '../lib/clickFn'
import Modal from './Modal'

require('./IssuesList.scss')

export default class IssuesList extends Component {
  static get displayName () { return 'IssuesList' }

  constructor (props) {
    super(props)
    this.state = {}
  }

  toggleIssue (issue) {
    this.setState({ issue })
  }

  render () {
    return (
      <ul className='IssuesList'>
        {issues.map(issue => {
          const category = categories.find(c => c.id === issue.category_id)
          return (
            <li key={issue.id}>
              <a href='' onClick={clickFn(this, 'toggleIssue', issue)} style={{backgroundImage: `url(/nyheder/htm/drdinstemme/issues/${issue.id}.jpg)`}}>
                <div className='gradient'>
                  <h1>{issue.title}</h1>
                  <h2>
                    <span className='category' style={{backgroundColor: category.color}}>
                    {category.title}
                    </span>
                  </h2>
                </div>
              </a>
            </li>
          )
        })}
        <Modal issue={this.state.issue} />
      </ul>
    )
  }
}
