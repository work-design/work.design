process.env.NODE_ENV = process.env.NODE_ENV || 'production'
process.env.RAILS_ENV = process.env.NODE_ENV

const viteConfig = require('./base')

module.exports = viteConfig
