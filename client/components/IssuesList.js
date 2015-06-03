import React, { Component } from 'react'
import AnswerTable from './AnswerTable'
import { issues, answers, categories } from '../data'
import clickFn from '../lib/clickFn'

require("./IssuesList.scss")

export default class IssuesList extends Component {
  static get displayName () { return "IssuesList" }

  constructor (props) {
    super(props)

    this.state = {
      expandedIssues: new Set()
    }
  }

  toggleIssue (issue) {
    let expanded = this.state.expandedIssues
    if (expanded.has(issue.id)) {
      expanded.delete(issue.id)
    } else {
      expanded.add(issue.id)
    }
    this.setState({ expandedIssues: expanded })
  }

  render() {
    return (
      <ul className='IssuesList'>
        {issues.map(issue => {
          const category = categories.find(c => c.id === issue.category_id)
          const expanded = this.state.expandedIssues.has(issue.id)
          return (
            <li key={issue.id}>
              <a href='' onClick={clickFn(this, 'toggleIssue', issue)} style={{backgroundImage: `url(/images/sag/${issue.id}.jpg)`}}>
                <div className='gradient'>
                  <h1>{issue.title}</h1>
                  <h2>
                    <span className='category' style={{backgroundColor: category.color}}>
                    {category.title}
                    </span>
                  </h2>
                </div>
              </a>
              <div className={`extra ${expanded ? 'visible' : ''}`}>
                <div className='description' dangerouslySetInnerHTML={{__html: issue.description}}></div>
                <AnswerTable answers={answers.filter(answer => {
                  return issue.id === answer.issue_id
                })} />
              </div>
            </li>
          )
        })}
      </ul>
    )
  }
}
