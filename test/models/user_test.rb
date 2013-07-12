# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "User Model" do
  before do
    @user = build(:user)
  end

  it 'can construct a new instance' do
    refute_nil @user
  end

  it 'can not save when attributes invalid' do
    @user.name = nil
    @user.gender = nil
    refute @user.valid?
    assert @user.errors.include?(:name)
    assert @user.errors.include?(:gender)
  end

  it 'validate year format' do
    assert @user.valid?
    @user.birth_on_year = 111
    @user.work_on_year = 111
    refute @user.valid?
    assert @user.errors.include?(:birth_on)
    assert @user.errors.include?(:work_on)
    assert_nil @user.birth_on
    assert_nil @user.work_on
  end

  it 'validate month format' do
    assert @user.valid?
    @user.birth_on_month = 111
    @user.work_on_month = 111
    refute @user.valid?
    assert @user.errors.include?(:birth_on)
    assert @user.errors.include?(:work_on)
    assert_nil @user.birth_on
    assert_nil @user.work_on
  end

  it 'can get birth_on' do
    assert @user.save
    assert_equal @user.birth_on, Date.new(1999, 12)
    assert_equal @user.work_on, Date.new(2012, 9)
  end
end
