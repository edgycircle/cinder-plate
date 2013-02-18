{config} = require './config'

config.files.javascripts.joinTo =
  'javascripts/app.js': /^app/
  'javascripts/vendor.js': /^vendor(?!.*ember.js)/

config.optimize = true

config.paths =
  public: 'production-build'

exports.config = config
