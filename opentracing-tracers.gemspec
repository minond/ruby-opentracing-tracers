require_relative 'lib/opentracing/tracers/version'

Gem::Specification.new do |spec|
  spec.name          = "opentracing-tracers"
  spec.version       = OpenTracing::Tracers::VERSION
  spec.authors       = ["Marcos Minond"]
  spec.email         = ["minond.marcos@gmail.com"]

  spec.summary       = %q{OpenTracing tracers}
  spec.description   = %q{OpenTracing tracers}
  spec.homepage      = "http://github.com/minond/ruby-opentracing-tracers"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://github.com/minond/ruby-opentracing-tracers"
  spec.metadata["changelog_uri"] = "http://github.com/minond/ruby-opentracing-tracers"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
