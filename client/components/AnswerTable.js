import React from 'react'
import { parties } from '../data'
import { positions as posLabel } from '../lib/labels'
import sortByMandates from '../lib/sortByMandates'

require('./AnswerTable.scss')

function range (from, to) {
  let nums = []
  for (let i = from; i <= to; i++) nums.push(i)
  return nums
}

export default React.createClass({
  displayName: 'AnswerTable',
  propTypes: {
    answers: React.PropTypes.array
  },
  render () {
    const allAnswers = this.props.answers
    let wings = allAnswers.reduce((answers, answer) => {
      answer.party = parties.find(p => p.id === answer.party_id)
      answers[answer.party.wing].push(answer)
      return answers
    }, { left: [], right: [] })
    wings.left = sortByMandates(wings.left)
    wings.right = sortByMandates(wings.right)
    return (
      <table className='AnswerTable'>
        <tbody>
          {range(0, wings.left.length - 1).map(i => {
            return ['left', 'right'].map(wing => {
              const answer = wings[wing].shift()
              return (
                <tr key={answer.id}>
                  <td className={`list ${cssClass(answer.party.list)}`} style={{backgroundColor: answer.party.color}}>
                    <a href={`#answer-${answer.id}`}>
                      {answer.party.list}
                    </a>
                  </td>
                  <td className={`position ${answer.position}`}>
                    <a href={`#answer-${answer.id}`}>
                      {posLabel(answer.position)}
                    </a>
                  </td>
                </tr>
              )
            })
          })}
        </tbody>
      </table>
    )
  }
})

function cssClass (list) {
  const specials = {'æ': 'ae', 'ø': 'oe', 'å': 'aa'}
  if (Object.keys(specials).indexOf(list) > -1) {
    return specials[list]
  }
  return list
}
