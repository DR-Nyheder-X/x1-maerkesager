import React from 'react'
import { parties } from '../data'
import { positions as posLabel } from '../lib/labels'

require('./AnswerTable.scss')

export default React.createClass({
  displayName: 'AnswerTable',
  propTypes: {
    answers: React.PropTypes.array
  },
  render () {
    const answers = this.props.answers
    return (
      <table className='AnswerTable'>
        <tbody>
          {answers.map(answer => {
            const party = parties.find(p => p.id === answer.party_id)
            return (
              <tr key={answer.id}>
                <td className={`list ${cssClass(party.list)}`} style={{backgroundColor: party.color}}>
                  <a href={`#answer-${answer.id}`}>
                    {party.list}
                  </a>
                </td>
                <td className={`position ${answer.position}`}>
                  <a href={`#answer-${answer.id}`}>
                    {posLabel(answer.position)}
                  </a>
                </td>
              </tr>
            )
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
