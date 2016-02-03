$LOAD_PATH.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name = 'rubyfaction'
  s.version = '1.0.0'
  s.platform = Gem::Platform::RUBY
  s.author = 'Code Farm'
  s.email = ['contato@codefarm.com.br']
  s.homepage = 'https://github.com/codefarmdev/rubyfaction'
  s.summary = 'Easily access Webfaction services through the Webfaction API.'
  s.description = 'Easily access Webfaction services through the Webfaction API. This gem exactly mirrors the functionality provided by the Webfaction API in Ruby.'
  s.license = 'GPLv2'

  s.required_ruby_version = '>= 2.0.0'

  s.files = 'lib/rubyfaction.rb'
  s.files += Dir['lib/rubyfaction/**']

  s.add_dependency 'retryable-rb'

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rdoc'
  s.add_development_dependency 'bundler'
  s.add_development_dependency 'jeweler'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'vcr'


end
