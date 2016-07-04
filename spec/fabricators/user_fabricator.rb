Fabricator(:user) do
  name  { Faker::Name.name               }
  uid   { |attrs| 'null|' + attrs[:name] }
  email { Faker::Internet.email          }
end