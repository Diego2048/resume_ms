# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "Skill Model" do
  it 'can construct a new instance' do
    @skill = Skill.new
    refute_nil @skill
  end
end
