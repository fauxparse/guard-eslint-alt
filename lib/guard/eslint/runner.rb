module Guard
  class ESLint
    class Runner
      attr_reader :options

      def self.run(paths, **options)
        new(options).run(paths)
      end

      def initialize(options = {})
        @options = options
      end

      def run(paths = [])
        command = [options[:command]]
        command += ['--max-warnings=0'] if options[:fail_on_warnings]
        command += paths
        result = system(command.join(' '))
        notify(result)
      end

      def notify(result)
        Notifier.notify(
          result ? 'All clean!' : 'You’ve got some errors to fix',
          title: 'ESLint',
          image: result ? :success : :failed
        )
      end
    end
  end
end
