import 'babel/polyfill'

import assert from 'assert'
global.assert = assert

// const jsdom = require('jsdom').jsdom
// global.document = jsdom('<!doctype html><html><body></body></html>')
// global.window = document.defaultView

import React from 'react/addons'
const TestUtils = React.addons.TestUtils

global.renderComponent = function(Handler, props = {}) {
  const component = <Handler {...props} />
  const renderedComponent = TestUtils.renderIntoDocument(component)
  return React.findDOMNode(renderedComponent)
}

global.unmountComponent = function() {
  React.unmountComponentAtNode(document.body)
}

