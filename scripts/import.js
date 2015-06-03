#!./node_modules/babel/bin/babel-node
import mysql from 'mysql'
import Promise from 'bluebird'
import fs from 'fs'
import { sync as mkdirpSync } from 'mkdirp'

var connection = mysql.createConnection(
  'mysql2://demoaften:2tfwQfcUWDGbSPQV@localhost/demoaften')
connection.connect()

function q(query, done) {
  return new Promise(function(resolve, reject) {
    connection.query(query, (err, rows, fields) => {
      if (err) return reject(err);
      resolve(rows, fields);
    })
  }).catch(function(err) { throw(err) })
}

console.log('--- --- --- --- ---')

Promise.all([
  q("SELECT * FROM sager"),
  q("SELECT * FROM emner"),
  q("SELECT * FROM partier"),
  q("SELECT * FROM partiholdninger"),
  q("SELECT * FROM partisagsvar")
]).then(values => {
  console.log('fetched')
  return values
}).then(values => {
  let [
    issues,
    categories,
    parties,
    answers,
    positions
  ] = values

  console.log('formatting issues')
  issues = issues.map(issue => {
    return {
      id: issue.sagid,
      title: issue.navn,
      category_id: issue.emneid,
      description: issue.beskrivelse,
      question: issue.sporgsmal
    }
  })

  console.log('formatting categories')
  categories = categories.map(category => {
    return {
      id: category.emneid,
      title: category.emnenavn,
      color: `#${category.emnefarve}`
    }
  })

  console.log('formatting parties')
  parties = parties.map((party, id) => {
    return {
      id,
      list: party.bogstav.toLowerCase(),
      name: party.navn,
      short_name: party.kortnavn,
      color: `#${party.farve}`,
      block: party.blok,
      mandates: party.mandater
    }
  })

  console.log('formatting answers')
  answers = answers.map(answer => {
    const party = parties.find(party => {
      const converts = { aa: 'å', ae: 'æ', oe: 'ø' }
      let list = answer.partibogstav
      if (Object.keys(converts).indexOf(list) > -1) { list = converts[list] }
      return party.list === list
    })
    const position = positions.find(position => {
      return position.sagid === answer.sagid &&
        answer.partibogstav === position.partibogstav
    })
    return {
      id: answer.delta,
      issue_id: answer.sagid,
      party_id: party ? party.id : null,
      position: ['yes', 'no', 'maybe'][position.svar],
      body: answer.tekst
    }
  })

  console.log('done')
  return { issues, categories, parties, answers}
}).then(data => {

  for (let key in data) {
    mkdirpSync('./client/data')
    fs.writeFileSync(`./client/data/${key}.json`, JSON.stringify(data[key]))
  }

}).then(() => {
  process.exit(0)
}).catch(e => {
  throw(e)
  exit(1)
})

