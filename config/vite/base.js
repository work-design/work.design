const { viteConfig } = require('rails_vite')

module.exports = {
  define: {
    __dirname: {}
  },
  ...viteConfig
}
