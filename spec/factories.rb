FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "foo#{n}" }
  end
  
  factory :job do
    title "titulo"
    user
    company_name "Lorem ipsum"
    contact_email "lorem@ipsum.com" 
    description "Lorem ipsum"  
    website "www.Loremipsum.com"  

    factory :filled do
      filled true
    end

  end
end
