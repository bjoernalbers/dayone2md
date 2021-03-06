# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dayone2md/version'

Gem::Specification.new do |spec|
  spec.name          = 'dayone2md'
  spec.version       = DayOne2MD::VERSION
  spec.authors       = ['Björn Albers']
  spec.email         = ['bjoernalbers@gmail.com']

  spec.summary       = "#{spec.name}-#{spec.version}"
  spec.description   = 'Convert a DayOne Journal into Markdown textfiles'
  spec.homepage      = 'https://github.com/bjoernalbers/dayone2md'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'slop', '~> 4.5'
  spec.add_dependency 'plist', '~> 3.3'
  spec.add_dependency 'activemodel', '~> 4.2'

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
