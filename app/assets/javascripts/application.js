const modules = import.meta.glob('../images/**/*')
for (const path in modules) {
  console.log(path)  // 如果没有引用的话，无法编译进 manifest
}

// css
import '../stylesheets/css.scss'
import 'rails_design_engine_ui/stylesheets/app.scss'
import '@fortawesome/fontawesome-free/css/all.css'

import 'rails_design_engine_ui/javascripts/rails_design'
import './channels'
