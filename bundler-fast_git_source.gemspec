require_relative 'lib/bundler/fast_git_source/version'

Gem::Specification.new do |spec|
  spec.name          = "bundler-fast_git_source"
  spec.version       = Bundler::FastGitSource::VERSION
  spec.authors       = ["Fumiaki MATSUSHIMA"]
  spec.email         = ["mtsmfm@gmail.com"]

  spec.summary       = %q{Make bundler git source faster}
  spec.description   = %q{Make bundler git source faster}
  spec.homepage      = "https://github.com/mtsmfm/bundler-fast_git_source"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/mtsmfm/bundler-fast_git_source"
  spec.metadata["changelog_uri"] = "https://github.com/mtsmfm/bundler-fast_git_source"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
