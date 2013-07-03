config = require('./config').config
isProductionVendorFile = require('./config').isProductionVendorFile

config.files.javascripts.joinTo =
  'javascripts/app.js': /^app/
  'javascripts/vendor.js': (path) -> isProductionVendorFile path

config.optimize = true

config.paths =
  public: 'production-build'

exports.config = config
