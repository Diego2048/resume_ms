require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "Project Model" do
  it 'can construct a new instance' do
    @project = Project.new
    refute_nil @project
  end
end
