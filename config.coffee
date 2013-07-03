fs   = require 'fs'
path = require 'path'

exports.config =
  files:
    javascripts:
      defaultExtension: 'coffee'
      joinTo:
        'javascripts/app.js': /^app/
        'javascripts/vendor.js': (path) -> isDevelopmentVendorFile path
      order:
        before: [
          'vendor/javascripts/jquery-1.9.1.js'
          'vendor/javascripts/handlebars-1.0.0-rc.4.js'
          ]
    stylesheets:
      defaultExtension: 'scss'
      joinTo:
        'stylesheets/app.css': /^(app|vendor)/
    templates:
      precompile: true
      root: 'templates'
      defaultExtension: 'hbs'
      joinTo: 'javascripts/app.js' : /^app/
  modules:
    wrapper: false
    definition: false
  conventions:
    ignored: (filePath) ->
      if filePath.indexOf(path.join 'app', 'templates') == 0
        return false
      else
        return startsWith path.basename(filePath), '_'

startsWith = (string, substring) -> string.lastIndexOf(substring, 0) == 0

developmentVendorJavascripts = [
  'jquery-1.9.1.js'
  'ember-1.0.0-rc.6.js'
  'ember-data-0.13.js'
  'handlebars-1.0.0-rc.4.js'
]

productionVendorJavascripts = [
  'jquery-1.9.1.js'
  'ember-1.0.0-rc.6.min.js'
  'ember-data-0.13.min.js'
  'handlebars-1.0.0-rc.4.js'
]

isDevelopmentVendorFile = (filePath) ->
  return false unless startsWith(filePath, 'vendor/')
  return developmentVendorJavascripts.indexOf(path.basename(filePath)) > -1

exports.isProductionVendorFile = (filePath) ->
  return false unless startsWith(filePath, 'vendor/')
  return productionVendorJavascripts.indexOf(path.basename(filePath)) > -1
