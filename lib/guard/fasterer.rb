require 'guard/fasterer/version'

module Guard
  class Fasterer < Plugin
    def initialize(options = {})
      super

      @options = { run_on_start: false,
                   bundler: File.exist?("#{Dir.pwd}/Gemfile")
                 }.merge(options)
    end

    def bundler?
      @options[:bundler]
    end

    def run_on_start?
      @options[:run_on_start]
    end

    def start
      Kernel.system(fasterer_command) if run_on_start?
      true
    end

    def stop
      true
    end

    def reload
      true
    end

    def run_all
      Kernel.system(fasterer_command)
    end

    def run_on_change(_paths)
      system(fasterer_command)
    end

    private

    def fasterer_command
      cmd = []
      cmd << 'bundle exec' if bundler?
      cmd << 'fasterer'

      cmd.join(' ')
    end
  end
end
