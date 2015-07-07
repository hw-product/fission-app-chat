$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__)) + '/lib/'
require 'fission-app-chat/version'
Gem::Specification.new do |s|
  s.name = 'fission-app-chat'
  s.version = FissionApp::Chat::VERSION.version
  s.summary = 'Fission App Chat'
  s.author = 'Heavywater'
  s.email = 'fission@hw-ops.com'
  s.homepage = 'http://github.com/hw-product/fission-app-chat'
  s.description = 'Fission chat interface'
  s.require_path = 'lib'
  s.add_dependency 'fission-data'
  s.add_dependency 'fission-app'
  s.files = Dir['{lib,app,config}/**/**/*'] + %w(fission-app-chat.gemspec README.md CHANGELOG.md)
end
