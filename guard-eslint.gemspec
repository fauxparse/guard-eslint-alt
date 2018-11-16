lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "guard/eslint/version"

Gem::Specification.new do |spec|
  spec.name          = "guard-eslint"
  spec.version       = GuardEslintVersion.to_s
  spec.authors       = ["Matt Powell"]
  spec.email         = ["fauxparse@gmail.com"]

  spec.summary       = %q{Run eslint with guard}
  spec.homepage      = "https://github.com/fauxparse/guard-eslint"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16.a"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency 'guard-compat', '~> 1.1'
end
