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
      <div className='IssuesList'>
        {issues.map(issue => {
          const category = categories.find(c => c.id === issue.category_id)
          return (
            <div className='span-4'>
              <div className='item dr-spot heading-medium' key={issue.id}>
                <a href={`#issue-${issue.id}`} onClick={clickFn(this.props, 'onIssueClick', issue)}>
                  <span role='presentation' aria-hidden='true' className='image-wrap ratio-16-9 lazy-broken'>
                    <img src={`http://www.dr.dk/nyheder/htm/drdinstemme/issues/${issue.id}.jpg`} alt='Sed do eiusmod tempor.' width='640' height='400' role='presentation' aria-hidden='true' />
                  </span>
                  <div className='title'>
                    <div className='label'>
                      <span>{category.title}</span>
                    </div>
                    {issue.title.split(' ').map(word => {
                      return <span>{word}</span>
                    })}
                  </div>
                </a>
              </div>
            </div>
          )
        })}
        <br style={{clear: 'both'}} />
      </div>
    )
  }
})
