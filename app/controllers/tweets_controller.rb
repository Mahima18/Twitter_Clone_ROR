class TweetsController < ApplicationController
	before_action :set_tweet, only: [:show, :edit, :update, :destroy]
	before_action :correct_user, only: [:show, :edit, :destroy]
	before_action :authenticate_user!

	def index
	  @tweets = Tweet.all
	end

	def show
	end
	 
	def new
	  @tweet = current_user.tweets.build
	end

	def edit
	end
	 
	def create
	  @tweet = current_user.tweets.build(tweet_params)

	  @tweet.user_id = current_user.id
	  if @tweet.save
	      redirect_to '/tweets#index'
	  else
	    render 'new'
	  end
	end

	def update
		respond_to do |format|
			if @tweet.update(tweet_params)
				format.html { redirect_to @tweet, notice: 'Blog was successfully updated.' }
			else
				format.html { render :edit }
			end
		end
	end

	def destroy
		@tweet = Tweet.find(params[:id])
		@tweet.destroy
		redirect_to '/', :notice => "Your tweet has been deleted"
	end

	def correct_user
		@tweet = current_user.tweets.find_by(id: params[:id])
		redirect_to root_path, notice: "not authorized" if @tweet.nil?
	end
	 
	private

	def set_tweet
		@tweet = Tweet.find(params[:id])
	end
	  
	def tweet_params
	  params.require(:tweet).permit(:body, :title)
	end

end
