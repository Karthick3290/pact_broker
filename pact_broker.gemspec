# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pact_broker/version'

Gem::Specification.new do |gem|
  gem.name          = "pact_broker"
  gem.version       = PactBroker::VERSION
  gem.authors       = ["Bethany Skurrie", "Sergei Matheson", "Warner Godfrey"]
  gem.email         = ["bskurrie@dius.com.au", "serge.matheson@rea-group.com", "warner@warnergodfrey.com"]
  gem.description   = %q{A server that stores and returns pact files generated by the pact gem. It enables head/prod cross testing of the consumer and provider projects.}
  gem.summary       = %q{See description}
  gem.homepage      = "https://github.com/bethesque/pact_broker"

  gem.required_ruby_version = '>= 2.2.0'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.license       = 'MIT'

  #gem.add_runtime_dependency 'pact'
  gem.add_runtime_dependency 'httparty', '~> 0.14'
  gem.add_runtime_dependency 'json', '> 1.8', '< 3.0'
  gem.add_runtime_dependency 'roar', '~> 1.1'
  gem.add_runtime_dependency 'reform', '~> 2.2.0'
  gem.add_runtime_dependency 'dry-validation', '~> 0.10.5'
  gem.add_runtime_dependency 'sequel', '~> 4.23'
  gem.add_runtime_dependency 'webmachine', '1.4.0'
  gem.add_runtime_dependency 'semver2', '~> 3.4.2'
  gem.add_runtime_dependency 'rack', '< 3.0'
  gem.add_runtime_dependency 'redcarpet', '~>3.1'
  gem.add_runtime_dependency 'pact', '~>1.4'
  gem.add_runtime_dependency 'pact-support', '~>0.4', '>=0.4.2'
  gem.add_runtime_dependency 'padrino-core', '~>0.12.4'
  gem.add_runtime_dependency 'haml', '~>4.0'
  gem.add_runtime_dependency 'sucker_punch', '~>2.0'

  gem.add_development_dependency 'sqlite3'
  gem.add_development_dependency 'pry-byebug'
  gem.add_development_dependency 'rake', '~>10.0'
  gem.add_development_dependency 'fakefs', '~>0.4'
  gem.add_development_dependency 'mysql2', '~>0.3.15'
  gem.add_development_dependency 'webmock', '~>2.3'
  gem.add_development_dependency 'rspec', '~>3.0'
  gem.add_development_dependency 'rspec-its'
  gem.add_development_dependency 'database_cleaner'
  gem.add_development_dependency 'pg'
end
