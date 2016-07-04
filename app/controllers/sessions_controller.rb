class SessionsController < ApplicationController
  def create
    UserRegistration.new(auth_hash).tap do |ur|
      authenticate! ur.user       

      if ur.created?
        flash[:notice] = "Account created"
        flash[:alert] = "Your github email is private. You won't be able to get email notifications." if auth_hash["info"]["email"].nil?
      else
        flash[:notice] = "Welcome back"
        flash[:alert] = "Your github email is private. You won't be able to get email notifications." if auth_hash["info"]["email"].nil?
      end
    end
    redirect_to root_url
  end

  def destroy
    logout!
    redirect_to root_url
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
