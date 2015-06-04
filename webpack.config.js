var path = require('path')
var webpack = require('webpack')

var currentEnv = process.env.NODE_ENV
var env = {
  test: currentEnv === 'test',
  development: currentEnv === 'development',
  production: currentEnv === 'production'
}

var index = './client/index'
var plugins = [new webpack.NoErrorsPlugin()]
var loaders = ['babel']

if (env.production) {
  // plugins.push(new webpack.optimize.UglifyJsPlugin())
  // plugins.push(new webpack.optimize.DedupePlugin())
} else {
  plugins.push(new webpack.HotModuleReplacementPlugin())
  loaders.unshift('react-hot')
}

var config = {
  devtool: env.production ? null : 'eval-sourcemaps',
  color: true,
  entry: env.production ? index : [
    'webpack-dev-server/client?http://localhost:3000',
    'webpack/hot/only-dev-server',
    index
  ],
  output: {
    path: path.join(__dirname, 'build'),
    filename: 'bundle.js',
    publicPath: '/client/'
  },
  plugins: plugins,
  resolve: {
    extensions: ['', '.js', '.jsx']
  },
  module: {
    loaders: [
      { test: /\.jsx?$/, loaders: loaders, include: path.join(__dirname, 'client') },
      { test: /\.s?css?$/, loaders: ['style', 'css', 'sass'] }
    ]
  }
}

module.exports = config

