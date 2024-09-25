# frozen_string_literal: true

require_relative "lib/tailwindcss/ruby/version"

Gem::Specification.new do |spec|
  spec.name = "tailwindcss-ruby"
  spec.version = Tailwindcss::Ruby::VERSION
  spec.authors = ["Mike Dalessio", "David Heinemeier Hansson"]
  spec.email = ["mike.dalessio@gmail.com", "david@loudthinking.com"]

  spec.summary = "A self-contained `tailwindcss` executable."
  spec.description = "A self-contained `tailwindcss` executable, wrapped up in a ruby gem. That's it. Nothing else."
  spec.homepage = "https://github.com/flavorjones/tailwindcss-ruby"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/flavorjones/tailwindcss-ruby/blob/main/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir["{app,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  spec.bindir = "exe"
  spec.executables << "tailwindcss"
  spec.require_paths = ["lib"]
end
