require 'guard'
require 'guard/guard'
require 'guard/notifier'
require 'jshint'

module Guard
  class JshintOnRails < Guard
    VERSION = '0.0.8'

    def run_on_change(paths)
      error = nil
      begin
        output = capture_output do
          lint = ::JSHint::Lint.new(
            :paths => paths,
            :config_path => File.join(Dir.pwd, 'config', 'jshint.yml')
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
