require 'guard'
require 'guard/guard'

module Guard
  class Staticmatic < Guard

    # Initialize a Guard.
    # @param [Array<Guard::Watcher>] watchers the Guard file watchers
    # @param [Hash] options the custom Guard options
    def initialize(watchers = [], options = {})
      super watchers, options
      @options = {
        :bundler => File.exist?("#{Dir.pwd}/Gemfile")
      }.merge(options)
    end

    # Call once when Guard starts. Please override initialize method to init stuff.
    # @raise [:task_has_failed] when start has failed
    def start
      true
    end

    # Called when `stop|quit|exit|s|q|e + enter` is pressed (when Guard quits).
    # @raise [:task_has_failed] when stop has failed
    def stop
      true
    end

    # Called when `reload|r|z + enter` is pressed.
    # This method should be mainly used for "reload" (really!) actions like reloading passenger/spork/bundler/...
    # @raise [:task_has_failed] when reload has failed
    def reload
      true
    end

    # Called when just `enter` is pressed
    # This method should be principally used for long action like running all specs/tests/...
    # @raise [:task_has_failed] when run_all has failed
    def run_all
      system build_command
    end

    # Called on file(s) modifications that the Guard watches.
    # @param [Array<String>] paths the changes files or paths
    # @raise [:task_has_failed] when run_on_change has failed
    def run_on_changes(paths)
      system build_command
    end

    # Called on file(s) deletions that the Guard watches.
    # @param [Array<String>] paths the deleted files or paths
    # @raise [:task_has_failed] when run_on_change has failed
    def run_on_removals(paths)
      true
    end

  private
  
    def build_command
      staticmatic_root = if @options[:input]
        @options[:input]
      else
        '.'
      end

      cmds = []
      cmds << "bundle exec" if @options[:bundler]
      cmds << "staticmatic build #{staticmatic_root}"
      cmds.join(" ")
    end
  end
end