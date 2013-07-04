require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "Experience Model" do
  it 'can construct a new instance' do
    @experience = Experience.new
    refute_nil @experience
  end
end
