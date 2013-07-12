require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "Project Model" do
  before do
    @project = build(:project)
  end

  it 'can construct a new instance' do
    refute_nil @project
  end

  it 'can not save when attributes invalid' do
    @project.name = nil
    refute @project.valid?
    assert @project.errors.include?(:name)
  end

  it 'can not save when attributes invalid' do
    assert_equal @project.user.name, 'foobar'
  end
end
