require "bundler/fast_git_source/version"

module Bundler
  module FastGitSource
    class Error < StandardError; end
    # Your code goes here...
  end
end

Bundler::Source::Git::GitProxy.prepend(Module.new do
  def git(command, *args)
    if command.start_with?('clone')
      super(command.sub('--no-hardlinks', '') + ' --depth=1', *args)
    elsif command.start_with?('fetch')
      super(command + ' --depth=1', *args)
    else
      super
    end
  end
end)
