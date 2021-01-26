class BirthdayEventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @birthday_events = BirthdayEvent.all()

  end

  def show
    @birthday_event = BirthdayEvent.find(params[:id])

  end

  def new
    @birthday_event = BirthdayEvent.new()
  end

  def create
    @birthday_event = BirthdayEvent.new(birthday_event_params)
    @birthday_event.user_id = current_user.id
    if @birthday_event.valid?
      @birthday_event.save
      redirect_to "/birthday_events"
    else
      flash[:notice] = @birthday_event.errors.full_messages
      render "new"
    end
  end

  def edit
  @birthday_event = BirthdayEvent.find(params[:id])

  end

  def update
    @birthday_event = BirthdayEvent.find(params[:id])
    if @birthday_event.update(birthday_event_params)
      redirect_to "/birthday_events"
    else
      render "edit"
    end
  end
  private
    
    def birthday_event_params
      params.require(:birthday_event).permit(:date, :bday_username, :user_id)
    end
end
