import React from 'react'
import { issues, categories } from '../data'
import clickFn from '../lib/clickFn'

require('./IssuesList.scss')

export default React.createClass({
  displayName: 'IssuesList',
  getInitialState () {
    return {}
  },
  propTypes: {
    onIssueClick: React.PropTypes.func
  },
  render () {
    return (
      <ul className='IssuesList'>
        {issues.map(issue => {
          const category = categories.find(c => c.id === issue.category_id)
          return (
            <li key={issue.id}>
              <a href='' onClick={clickFn(this.props, 'onIssueClick', issue)} style={{backgroundImage: `url(http://www.dr.dk/nyheder/htm/drdinstemme/issues/${issue.id}.jpg)`}}>
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
        <br style={{clear: 'both'}} />
      </ul>
    )
  }
})
