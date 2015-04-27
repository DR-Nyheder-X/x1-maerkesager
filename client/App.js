import React from 'react'

if (process.env.NODE_ENV === 'development') {
  require('./App.scss')
}

export default class App extends React.Component {
  render() {
    return (
      <h1>Hello world!</h1>
    )
  }
}
