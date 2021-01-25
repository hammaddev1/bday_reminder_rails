class UserController < ApplicationController
  before_action :authenticate_user!
  def show
    puts "hi how are you".blue
    # @user = 'Welcome to your rails application'
  end
end
