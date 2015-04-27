import React from 'react/addons'
import assert from 'assert'
import App from '../../client/App'

const TestUtils = React.addons.TestUtils
const AppFactory = React.createFactory(App)

describe("App", function() {
  beforeEach(function() {
    const app = <App />
    const renderedComponent = TestUtils.renderIntoDocument(app)

    this.elm = React.findDOMNode(renderedComponent)
  })
  it("exists", function() {
    assert.equal(this.elm.nodeName, 'H1')
  })
})

