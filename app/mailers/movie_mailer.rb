class MovieMailer < ActionMailer::Base
  default from: "movie@rama.com"

  def movie_notification(user, movie, type)
    @user  = user
    @movie = movie
    @type  = type
    mail(to: user.email, subject: "Your Movie #{movie.title} has been #{type}d")
  end
end
