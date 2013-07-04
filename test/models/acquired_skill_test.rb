require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "AcquiredSkill Model" do
  it 'can construct a new instance' do
    @acquired_skill = AcquiredSkill.new
    refute_nil @acquired_skill
  end
end
