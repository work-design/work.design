const modules = import.meta.glob('../../assets/images/**/*')
for (const path in modules) {
  console.log(path)  // 如果没有引用的话，无法编译进 manifest
}

import 'rails/stylesheets/css.scss'

import 'rails_design_engine_ui/javascripts/rails_design'
import 'rails/javascripts/channels'

application.debug = true
