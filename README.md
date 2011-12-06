Guard::JshintOnRails 
=============
This project is a fork from wireframe's [guard-jslint-on-rails](https://github.com/wireframe/guard-jslint-on-rails).
Instead of using the original [jslint-on-rails](https://github.com/psionides/jslint_on_rails), [jshint-on-rails](https://github.com/liquid/jshint_on_rails) is used here.

=============

Guard plugin to verify that Javascript files comply with [JSHint](http://jslint.com/) validations.


Install
-------

Install and configure the [JSHint on Rails](https://github.com/liquid/jshint_on_rails) gem.

Install the gem:

    $ gem install guard-jshint-on-rails

Add it to your Gemfile (inside development group):

``` ruby
gem 'guard-jshint-on-rails'
```

Add guard definition to your Guardfile by running this command:

    $ guard init jshint-on-rails

Configuration
-------------

``` ruby
# Guardfile
guard 'jshint-on-rails' do
  # watch for changes to application javascript files
  watch(%r{^app/assets/javascripts/.*\.js$})
end
```

Additional option `:config_path` is available to specify the path to the yaml file.

Please read [Guard doc](https://github.com/guard/guard#readme) for more information about the Guardfile DSL.
