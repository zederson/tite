# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tite/version'

Gem::Specification.new do |gem|
  gem.name          = 'tite'
  gem.version       = Tite::VERSION
  gem.authors       = ['Ederson de Lima']
  gem.email         = ['edersondelima@gmail.com']
  gem.description   = 'using google translate to speak text - Tite, FALA MUITO'
  gem.summary       = 'using google translate to speak text'
  gem.homepage      = 'https://github.com/zederson'

  gem.files         = %w(LICENSE.txt README.md) + Dir['lib/**/*'] + Dir['spec/**/*']
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features|factories)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'faraday', '~> 0.9.1'
  gem.add_dependency 'recursive-open-struct', '= 0.6.1'

  gem.add_development_dependency 'rspec', '~> 3.0.0'
  gem.add_development_dependency 'rspec-its'
  gem.add_development_dependency 'shoulda-matchers'
  gem.add_development_dependency 'json_spec', '~> 1.1.4'
  gem.add_development_dependency 'faker', '~> 1.0'
  gem.add_development_dependency 'factory_girl', '~> 4.4.0'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'pry-byebug'
end
