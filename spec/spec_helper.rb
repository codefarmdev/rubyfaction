$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'rubyfaction'
require 'tempfile'

def load_env(filename = '.env')
  return unless File.exists?(filename)

  File.foreach(filename) do |line|
    next if line.chomp.size == 0

    setting = line.split('=')
    key = setting.shift
    ENV[key] = setting.join('').chomp
  end
end

RSpec.configure do |config|
  load_env
end

CLIENT_OPTS = {
  :username => ENV['WEBFACTION_USERNAME'],
  :password => ENV['WEBFACTION_PASSWORD']
}

CLIENT = Rubyfaction::Client.new( CLIENT_OPTS )

STRING_NUMBER_REGEX = /^[-+]?[0-9]+$/
