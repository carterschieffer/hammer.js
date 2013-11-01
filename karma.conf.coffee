# an example karma.conf.coffee
module.exports = (config) ->
  browsers = ['Chrome','Firefox']

  #if process.env.TRAVIS
  #  browsers = 'SL_Chrome,SL_Firefox,SL_IE_9,SL_IE_10,SL_ANDROID_4,SL_IOS_6'.split(",")

  config.set
    frameworks: ['qunit']
    logLevel: config.LOG_DEBUG
    logColors: true
    browsers: browsers
    browserDisconnectTimeout: 5000
    singleRun: true
    files: [
      'node_modules/underscore/underscore.js'
      'node_modules/faketouches/faketouches.js'
      'hammer.js'
      'tests/*.js'
    ]

    # config for Travis CI
    sauceLabs:
      testName: 'Hammer.js'
      startConnect: false
      tunnelIdentifier: process.env.TRAVIS_JOB_NUMBER


    # For more browsers on Sauce Labs see:
    # https://saucelabs.com/docs/platforms/webdriver
    customLaunchers:
      'SL_Chrome':
        base: 'SauceLabs',
        browserName: 'chrome'

      'SL_Firefox':
        base: 'SauceLabs',
        browserName: 'firefox'

      'SL_IE_9':
        base: 'SauceLabs'
        browserName: 'internet explorer'
        platform: 'Windows 7'
        version: '9'

      'SL_IE_10':
        base: 'SauceLabs'
        browserName: 'internet explorer'
        platform: 'Windows 8'
        version: '10'

      'SL_ANDROID_4':
        base: 'SauceLabs'
        browserName: 'android'
        platform: 'Linux'
        version: '4.0'
        'device-orientation': 'portrait'

      'SL_IOS_6':
        base: 'SauceLabs'
        browserName: 'iphone'
        platform: 'OS X 10.8'
        version: '6.0'
        'device-orientation': 'portrait'