class CoEventsController < ApplicationController
  def index
    @co_events = CoEvent.order(created_at: :desc).page(params[:page]).per(20)
  end

  def show
    @co_event = CoEvent.find(params[:id])
  end
end
