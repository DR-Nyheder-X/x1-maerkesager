import React, { Component } from 'react'
import clickFn from '../lib/clickFn'
import AnswerTable from './AnswerTable'
import { answers as allAnswers, categories, parties } from '../data'

require('./Modal.scss')

export default class Modal extends Component {
  static get displayName () { return 'Modal' }

  static get propTypes () {
    return {
      issue: React.PropTypes.object.isRequired,
      onClose: React.PropTypes.func
    }
  }

  constructor (props) {
    super(props)

    this.state = props
  }

  componentWillReceiveProps (props) {
    this.setState(props)
  }

  close () {
    this.setState({ issue: undefined })
  }

  render () {
    const issue = this.state.issue

    const category = categories.find(c => c.id === issue.category_id)
    const answers = allAnswers.filter(a => a.issue_id === issue.id)

    return (
      <div className={`Modal backdrop`}>
        <div className='box'>
          <a href='' className='close-button' onClick={this.props.onClose}>&laquo; Tilbage</a>
          <header>
            <h1>{issue.title}</h1>
            <h2 className='category' style={{backgroundColor: category.color}}>{category.title}</h2>
          </header>
          <div className='description' dangerouslySetInnerHTML={{__html: issue.description}}></div>
          <h3>{issue.question}</h3>
          <AnswerTable answers={answers.filter(answer => {
            return issue.id === answer.issue_id
          })} />
          <h3>Partierne siger:</h3>
          {answers.map(answer => {
            const party = parties.find(p => p.id === answer.party_id)
            return (
              <dl>
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
}
