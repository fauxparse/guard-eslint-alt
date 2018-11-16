require 'guard/compat/plugin'

module Guard
  class ESLint < Plugin
    autoload :Runner, 'guard/eslint/runner'

    DEFAULT_OPTIONS = {
      all_on_start: true,
      fail_on_warnings: true,
      command: 'eslint',
    }

    attr_reader :options

    def initialize(options = {})
      super

      @options = DEFAULT_OPTIONS.merge(options)
    end

    def start
      run_all if options[:all_on_start]
    end

    def run_all
      UI.info 'Running eslint on all files'
      eslint
    end

    def run_on_additions(paths)
      partial(paths)
    end

    def run_on_modifications(paths)
      partial(paths)
    end

    private

    def partial(paths)
      paths = clean_paths(paths)

      return if paths.empty?

      displayed_paths = paths.map { |path| smart_path(path) }
      UI.info "Running eslint: #{displayed_paths.join(' ')}"

      eslint(paths)
    end

    def eslint(paths = [])
      Runner.run(paths, options)
    end

    def clean_paths(paths)
      paths = paths.map { |path| File.expand_path(path) }.uniq
      paths.reject do |path|
        next true unless File.exist?(path)
        included_in_other_path?(path, paths)
      end
    end

    def included_in_other_path?(target_path, other_paths)
      dir_paths = other_paths.select { |path| File.directory?(path) }
      dir_paths.delete(target_path)
      dir_paths.any? do |dir_path|
        target_path.start_with?(dir_path)
      end
    end

    def smart_path(path)
      if path.start_with?(Dir.pwd)
        Pathname.new(path).relative_path_from(Pathname.getwd).to_s
      else
        path
      end
    end
  end
end
