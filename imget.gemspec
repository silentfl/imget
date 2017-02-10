lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'imget/version'

Gem::Specification.new do |spec|
  spec.name          = 'imget'
  spec.version       = Imget::VERSION
  spec.authors       = ['Eugene Mazgalev']
  spec.email         = ['silentfl@mail.ru']

  spec.summary       = 'Get a list of images from the page'
  spec.homepage      = 'https://github.com/silentfl/imget'
  spec.license       = 'MIT'

  spec.files         = ['lib/imget.rb']
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'httparty', '0.14.0'
  spec.add_dependency 'nokogiri', '~> 1.7.0'
  spec.add_dependency 'bundler', '~> 1.11'

  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'webmock', '~> 2.3.2'
  spec.add_development_dependency 'simplecov', '~> 0.11.1'
end
