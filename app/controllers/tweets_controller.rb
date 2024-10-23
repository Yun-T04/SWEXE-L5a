class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end
  
  def create
    t = Tweet.new(message: params[:tweet][:message])
    t.user = User.find_by(uid: current_user.uid)
    t.save
    redirect_to tweets_path
  end
  
  def destroy
    Tweet.find(params[:id]).destroy
    redirect_to tweets_path
  end
end
