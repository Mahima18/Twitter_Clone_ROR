class UsersController < ApplicationController
  require "prawn"
  require "prawn/table"

  def show
    @user = User.all
    respond_to do |format|
      format.pdf do
        pdf = Prawn::Document.new
        table_data = Array.new
        table_data << ["User Email", "User Created At", "User Updated At"]
        @user.each do |p|
            table_data << [p.email, p.created_at.to_s, p.updated_at.to_s]
        end
        pdf.table(table_data, :width => 500, :cell_style => { :inline_format => true })
        send_data pdf.render, filename: 'users.pdf', type: 'application/pdf', :disposition => 'inline'
      end
    end
  end

  def normal_users
   @normal_users = User.where(:admin => false)
  end

  # def get_all_tweets(normal=nil)
  #  @get_all_tweets = normal.tweets
  # end

end