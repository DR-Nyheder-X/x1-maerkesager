import React from 'react'
import AnswerTable from './AnswerTable'
import { answers as allAnswers, categories, parties } from '../data'

require('./Modal.scss')

function idFromWatchLink (link) {
  const match = link.match(/https?:\/\/(www\.)?youtube.com\/watch\?v=([A-Za-z0-9\-_]+)/)
  return match ? match[2] : null
}

function ytEmbed (link) {
  const id = idFromWatchLink(link)
  return <iframe width='640' height='390' src={`https://www.youtube.com/embed/${id}`} frameBorder='0' allowFullscreen></iframe>
}

export default React.createClass({
  displayName: 'Modal',
  propTypes: {
    issue: React.PropTypes.object.isRequired,
    onClose: React.PropTypes.func
  },
  render () {
    const issue = this.props.issue

    const category = categories.find(c => c.id === issue.category_id)
    const answers = allAnswers.filter(a => a.issue_id === issue.id)

    return (
      <div className={`Modal backdrop`}>
        <a name='top'></a>
        <div className='box'>
          <a href='' className='close-button' onClick={this.props.onClose}>&laquo; Tilbage</a>
          <div className='item dr-spot heading-medium' key={issue.id}>
            <div className='title'>
              <div className='label'>
                <span>{category.title}</span>
              </div>
              {issue.title.split(' ').map(word => {
                return <span key={word}>{word}</span>
              })}
            </div>
          </div>
          <div className='description' dangerouslySetInnerHTML={{__html: issue.description}}></div>

          <h3>{issue.question}</h3>
          <AnswerTable answers={answers.filter(answer => {
            return issue.id === answer.issue_id
          })} />

          {issue.youtube && (
            <div>
              <h3>Video</h3>
              {ytEmbed(issue.youtube)}
            </div>
          )}

          <h3>Partierne siger:</h3>
          {answers.map(answer => {
            const party = parties.find(p => p.id === answer.party_id)
            return (
              <dl key={answer.id}>
                <a name={`answer-${answer.id}`}></a>
                <dt>
                  <span className='list' style={{backgroundColor: party.color}}>{party.list}</span>
                  {party.name}
                </dt>
                <dd dangerouslySetInnerHTML={{__html: answer.body}}></dd>
              </dl>
            )
          })}
        </div>
      </div>
    )
  }
})
