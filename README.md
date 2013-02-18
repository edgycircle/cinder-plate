# Cinder Plate
A skeleton for [Ember.js](http://emberjs.com/) applications using [Brunch](http://brunch.io/). It uses CoffeeScript and SASS. Handlebars templates live in separate files (unlike the usual approach of putting everthing in the `index.html`) and get pre-compiled. Cinder Plate is also able to generate a production build where JS and CSS files are minified. In addition the appropriate version of Ember.js (debug or production) is included.

## Getting Started
To create a new Ember.js application with Cinder Plate, you simply use Brunch and specify this repository as skeleton.

```
brunch new <app> -s git://github.com/edgycircle/cinder-plate.git
```

## Development
While developing you want to watch for changes and automatically rebuild the application. Brunch also gives you the option to start a simple server. If you would like to use something like [Pow](http://pow.cx/) remove the `--server` flag.

```
brunch watch --server
```

## Production Build
If you want to generate a production build (= minified files plus the non-debug version of Ember.js) you have to specify `config-production.coffee` as config file. The generated production build is put into the `production-build` directory.

```
brunch build --optimize --config config-production.coffee
```
