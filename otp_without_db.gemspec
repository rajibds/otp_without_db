# frozen_string_literal: true

require_relative 'lib/otp_without_db/version'

Gem::Specification.new do |spec|
  spec.name = 'otp_without_db'
  spec.version = OtpWithoutDb::VERSION
  spec.authors = ['tyrro']
  spec.email = ['rajib.das.shuva@gmail.com']

  spec.summary = 'Implement OTP without worrying about DB' # TODO: Write a short summary, because RubyGems requires one.
  spec.description = "Don't bother with DB while generating OTP" # TODO: Write a longer description or delete this line.
  spec.homepage = 'http://example.com' # TODO: Put your gem's website or public repo URL here.
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.8'

  spec.metadata['allowed_push_host'] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/tyrro/otp-without-db'
  spec.metadata['changelog_uri'] = 'https://github.com/tyrro/otp-without-db/blob/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata['rubygems_mfa_required'] = 'true'
end
