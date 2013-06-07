Guard::JsHintrb
=============
This is a fork of [Guard::JshintOnRails](https://github.com/MrOrz/guard-jshint-on-rails) which uses
[JsHintrb](https://github.com/stereobooster/jshintrb) to verify Javascript files.

=============

Guard plugin to verify that Javascript files comply with [JSHint](http://jslint.com/) validations.


Install
-------

Install and configure the [JSHint on Rails](https://github.com/liquid/jshint_on_rails) gem.

Install the gem:

    $ gem install guard-jshintrb

Add it to your Gemfile (inside development group):

``` ruby
gem 'guard-jshintrb'
```

Add guard definition to your Guardfile by running this command:

    $ guard init guard-jshintrb

Configuration
-------------

``` ruby
# Guardfile
guard 'guard-jshintrb' do
  # watch for changes to application javascript files
  watch(%r{^app/assets/javascripts/.*\.js$})
end
```

Additional option `:config_path` is available to specify the path to the yaml file.

Please read [Guard doc](https://github.com/guard/guard#readme) for more information about the Guardfile DSL.
