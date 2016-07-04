require 'rails_helper'

RSpec.describe MovieMailer, type: :mailer do
  describe '.movie_notification' do
    let(:user)  { Fabricate(:user).save                                                       }
    let(:movie) { Fabricate(:movie, user: user).save                                          }
    let(:type)  { %w(like hate).sample                                                        }
    let(:mail)  { MovieMailer.movie_notification(user, movie, type).deliver                   }

    it 'sets correct receiver' do
      expect(mail.to.first).to eq("#{user.email}")
    end

    it 'sets correct subject' do
      expect(mail.subject).to eq("Your Movie #{movie.title} has been #{type}d")
    end

    it 'assigns @name' do
      expect(mail.body.encoded).to match(user.name)
    end

    it 'assigns @movie' do
      expect(mail.body.encoded).to match(movie.title)
    end

    it 'assigns @type' do
      expect(mail.body.encoded).to match("#{type}d")
    end
  end
end