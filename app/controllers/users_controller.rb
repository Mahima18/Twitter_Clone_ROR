class UsersController < ApplicationController
  
  def normal_users
   @normal_users = User.where(:admin => false)
  end

  # def get_all_tweets(normal=nil)
  #  @get_all_tweets = normal.tweets
  # end

end