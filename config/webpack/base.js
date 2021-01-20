const { webpackConfig, config, merge } = require('@rails/webpacker')
const { resolve } = require('path')
const paths = require('rails_ui')
const customConfig = {
  resolve: {
    extensions: ['.scss']
  }
}

webpackConfig.entry = Object.assign(paths(), webpackConfig.entry)
webpackConfig.resolve.modules = webpackConfig.resolve.modules.concat(resolve('node_modules'))

debugger

module.exports = merge(webpackConfig, customConfig)
