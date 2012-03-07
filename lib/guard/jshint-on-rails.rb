require 'guard'
require 'guard/guard'
require 'guard/notifier'
require 'jshint'

module Guard
  class JshintOnRails < Guard

    def initialize(watchers=[], options={})
      super
      @config_path = File.join(Dir.pwd, options[:config_path] || 'config/jslint.yml')
    end

    def start
      UI.info "Guard::JsHintOnRails started using #{@config_path}"
    end

    def run_on_change(paths)
      error = nil
      begin
        output = capture_output do
          lint = ::JSHint::Lint.new(
            :paths => paths,
            :config_path => @config_path
          )
          lint.run
        end
      rescue ::JSHint::LintCheckFailure => e
        error = e
      end
      Notifier.notify((error ? 'failed' : 'passed'), :title => 'JSHint results', :image => (error ? :failed : :success))
      true
    end

    private
    def capture_output
      out = StringIO.new
      $stdout = out
      $stderr = out
      yield
      return out
    ensure
      $stderr = STDERR
      $stdout = STDOUT
    end
  end
end
