lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = 'pubsub-connect'
  gem.version       = '0.0.2'
  gem.date      = '2016-04-04'
  gem.authors       = ['Lareb Nawab']
  gem.license       = 'MIT'
  gem.email         = ['lareb.indore@gmail.com']
  gem.description   = %q{A lightweight ruby gem, which enables developers to send messages between servers and client apps (Android & iOS).}
  gem.summary       = %q{A lightweight ruby gem, which enables developers to send messages between servers and client apps (Android & iOS).}
  gem.homepage      = 'https://github.com/lareb/pubsub-connect'
  
  gem.files         = ["lib/pubsub.rb"]
  gem.add_dependency 'curb', '~> 0'
end
