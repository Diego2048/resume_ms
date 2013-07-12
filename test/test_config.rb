# -*- encoding : utf-8 -*-
PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)
require File.expand_path('../../config/boot', __FILE__)

FactoryGirl.find_definitions
DatabaseCleaner.strategy = :truncation

class MiniTest::Unit::TestCase
  include Rack::Test::Methods
  include FactoryGirl::Syntax::Methods

  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end

  # You can use this method to custom specify a Rack app
  # you want rack-test to invoke:
  #
  #   app Newresume::App
  #   app Newresume::App.tap { |a| }
  #   app(Newresume::App) do
  #     set :foo, :bar
  #   end
  #
  def app(app = nil &blk)
    @app ||= block_given? ? app.instance_eval(&blk) : app
    @app ||= Padrino.application
  end
end
