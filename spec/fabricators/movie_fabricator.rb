Fabricator(:movie) do
  date        { Faker::Date.forward(23)  }
  description { Faker::Hipster.paragraph }
  title       { Faker::Book.title        }
  user        { Fabricate(:user).save    }
end