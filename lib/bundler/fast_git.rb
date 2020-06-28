require "bundler/fast_git/version"

module Bundler
  module FastGit
    module GitProxyPatch
      def git(command, *args)
        new_command =
          if command.start_with?('clone')
            new_command = command.sub('--no-hardlinks', '') + ' --depth=1'
          elsif command.start_with?('fetch')
            new_command = command + ' --depth=1'
          end

        if new_command
          Bundler.ui.debug("[bundler-fast_git] Running #{new_command}")
          super(new_command, *args)
        else
          super
        end
      end
    end

    Bundler::Plugin.add_hook('before-install-all') do |dependencies|
      Bundler::Source::Git::GitProxy.prepend(GitProxyPatch)
    end
  end
end
