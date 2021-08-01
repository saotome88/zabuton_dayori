const { environment } = require('@rails/webpacker')

//bootstrap用に追加記述
const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
      $: 'jquery/src/jquery',
      jQuery: 'jquery/src/jquery',
      Popper: ['popper.js', 'default']
  })
)
//ここまで

module.exports = environment