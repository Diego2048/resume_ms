FactoryGirl.define do
  factory :user do
    name 'foobar'
    gender true
    birth_on_year 1999
    birth_on_month 12
    work_on_year 2012
    work_on_month 9
    degree 5
    email 'foobar@foobar.com'
    phone '13812345679'
    qq 10000
    msn 'foobar@foobar.com'
    city '北京'
    address '朝阳'
    hukou '北京'
  end

  factory :project do
    name '项目经验一'
    user
    begin_on_year 1999
    begin_on_month 12
    end_on_year 2012
    end_on_month 9
  end

end