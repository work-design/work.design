const { viteConfig } = require('rails_vite')

module.exports = {
  define: {
    'process.env': {},
    __dirname: {}
  },
  ...viteConfig
}
