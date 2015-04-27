import '../setup'
import App from '../../client/App'

describe("App", function() {
  beforeEach(function() {
    this.elm = renderComponent(App)
  })
  afterEach(unmountComponent)
  it("exists", function() {
    assert.equal(this.elm.nodeName, 'H1')
  })
})

