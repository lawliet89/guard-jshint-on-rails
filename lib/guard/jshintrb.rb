require 'guard'
require 'guard/guard'
require 'guard/notifier'
require 'jshintrb'

module Guard
  class jshintrb < Guard

    def initialize(watchers=[], options={})
      super
      @options = :default unless options[:options].nil?
      @jshint = ::Jshintrb::Lint.new(@options)
    end

    def start
      UI.info "Guard::jshintrb started using #{@config_path}"
    end

    def run_on_change(paths)
      error = ""

      paths.each do |path|
        output = @jshint.report path
        error += output unless output.empty?
      end

      Notifier.notify (error.empty? ? 'passed' : 'failed'),
                      :title => 'JSHint results',
                      :image => (error.empty? ? :success : :failed)

      if error.empty?
        $stdout.write "JSHint passed"
      else
        $stderr.write error
        throw :task_has_failed
    end

  end
end
