var webpack = require('webpack')

module.exports = function(config) {
  config.set({
    browsers: ["PhantomJS"],
    singleRun: true,
    frameworks: ["mocha"],
    files: ['test/webpack.js'],
    preprocessors: {
      "test/webpack.js": ["webpack", "sourcemap"]
    },
    reporters: ["progress"],
    webpack: {
      devtool: "inline-source-map",
      module: {
        loaders: [
          { test: /\.jsx?$/, loader: 'babel', exclude: /node_modules/ },
          { test: /\.s?css?$/, loader: 'null' }
        ]
      }
    },
    webpackServer: {
      noInfo: true
    }
  })
}

