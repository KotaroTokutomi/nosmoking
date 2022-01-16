class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    event = Event.new(event_parameter)
    event.user_id = current_user.id
    Tweet.create(body: event.title, user_id: current_user.id)
    if event.content == "喫煙day"
      Tweet.where(user_id: current_user.id).destroy_all
    else
    end
    if event.save
        redirect_to :action => "index"
    else
        redirect_to :action => "new"
    end
end

  private

  def event_parameter
    params.require(:event).permit(:title, :content, :start_time)
  end

end