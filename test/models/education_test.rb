require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "Education Model" do
  it 'can construct a new instance' do
    @education = Education.new
    refute_nil @education
  end
end
