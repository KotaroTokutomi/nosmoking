class UsersController < ApplicationController

    def show
        @user = User.find(params[:id]) 
        @events = Event.where(user_id: @user.id)
        @tweets_count = Tweet.where(user_id: @user.id).count
        @zyumyo = @tweets_count * @user.tabako * 14/1440.to_f
        @saving = @tweets_count * @user.tabako * 30
    end

end
