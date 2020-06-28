require "bundler/fast_git/version"

module Bundler
  module FastGit
    module GitProxyPatch
      def git(command, *args)
        Bundler.ui.debug(command)
        if command.start_with?('clone')
          super(command.sub('--no-hardlinks', '') + ' --depth=1', *args)
        elsif command.start_with?('fetch')
          super(command + ' --depth=1', *args)
        else
          super
        end
      end
    end

    Bundler::Plugin.add_hook('before-install-all') do |dependencies|
      Bundler::Source::Git::GitProxy.prepend(Module.new do
      end)
    end

    class Source < Bundler::Source::Git
    end

    class GitProxy < Bundler::Source::Git::GitProxy
      def git(command, *args)
        if command.start_with?('clone')
          super(command.sub('--no-hardlinks', '') + ' --depth=1', *args)
        elsif command.start_with?('fetch')
          super(command + ' --depth=1', *args)
        else
          super
        end
      end
    end

    class Plugin < Bundler::Plugin::API
      source "fast_git", Source
    end

    class Error < StandardError; end
    # Your code goes here...
  end
end