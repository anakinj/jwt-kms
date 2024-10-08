# frozen_string_literal: true

require_relative "lib/jwt/aws/kms/version"

Gem::Specification.new do |spec|
  spec.name = "jwt-aws-kms"
  spec.version = JWT::Aws::KMS::VERSION
  spec.authors = ["Joakim Antman"]
  spec.email = ["antman@gmail.com"]

  spec.summary = "AWS KMS algorithm extension for ruby-jwt"
  spec.description = "Utilize AWS KMS to handle the signing and verification of JWT tokens"
  spec.homepage = "https://github.com/anakinj/jwt-aws-kms"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/anakinj/jwt-aws-kms"
  spec.metadata["changelog_uri"] = "https://github.com/anakinj/jwt-aws-kms/blob/v#{JWT::Aws::KMS::VERSION}/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "aws-sdk-kms", "~> 1.0"
  spec.add_dependency "jwt", ">=2.9"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata["rubygems_mfa_required"] = "true"
end
