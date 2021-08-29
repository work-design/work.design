process.env.NODE_ENV = process.env.NODE_ENV || 'development'
process.env.RAILS_ENV = process.env.NODE_ENV

const viteConfig = require('./base')

module.exports = {
  define: {
    'process.env': {},
    __dirname: {}
  },
  ...viteConfig
}
