lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "callee/version"

Gem::Specification.new do |spec|
  spec.name = "callee"
  spec.version = Callee::VERSION
  spec.authors = ["Alex Musayev"]
  spec.email = ["alex.musayev@gmail.com"]

  spec.summary = "Make callable service classes"
  spec.description = "Callee provides a standardized way to define callable classes with a strict params specification, based on dry-initializer"
  spec.homepage = "https://github.com/dreikanter/callee"
  spec.license = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/dreikanter/callee/blob/master/CHANGELOG.md"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.required_ruby_version = ">= 2.5.0"
  spec.require_paths = ["lib"]

  spec.add_dependency "dry-initializer", ">= 2.5"

  spec.add_development_dependency "bundler", "~> 2.4"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "reek"
  spec.add_development_dependency "simplecov", "~> 0.19"
  spec.add_development_dependency "standard"
end
