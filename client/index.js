require('babel/polyfill')

import React from 'react'
import App from './components/App'

window.render = () => {
  console.log('trying render')
  const elm = document.getElementById('issues-root-bpfjVLpdn5z')
  if (!elm) {
    console.log('not found')
    return setTimeout(window.render, 300)
  } else {
    console.log('found, let\'s go')
    React.render(<App />, elm)
  }
}

window.render()
