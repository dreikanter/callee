lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "callee/version"

Gem::Specification.new do |spec|
  spec.name          = "callee"
  spec.version       = Callee::VERSION
  spec.authors       = ["Alex Musayev"]
  spec.email         = ["alex.musayev@gmail.com"]

  spec.summary       = "Make callable service classes"
  spec.description   = "Callee provides a standardized way to define callable classes with a strict params specification, based on dry-initializer"
  spec.homepage      = "https://github.com/dreikanter/callee"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/dreikanter/callee/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ["lib"]

  spec.add_dependency "dry-initializer", "~> 3.0"
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
