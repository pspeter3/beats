PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
  conf.include Mongoid::Matchers
  conf.after :suite do
    Mongoid.master.collections.select do |collection|
      collection.name !~ /system/
    end.each(&:drop)
  end
end

def app
  ##
  # You can handle all padrino applications using instead:
  #   Padrino.application
  Beats.tap { |app|  }
end
