fs   = require 'fs'
path = require 'path'

exports.config =
  files:
    javascripts:
      defaultExtension: 'coffee'
      joinTo:
        'javascripts/app.js': /^app/
        'javascripts/vendor.js': /^vendor(?!.*ember-production.js)/
      order:
        before: [
          'vendor/javascripts/jquery-1.8.3.min.js'
          'vendor/javascripts/handlebars-1.0.0.rc.2.js'
          ]
        after: [
          'vendor/javascripts/ember-data.js'
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
