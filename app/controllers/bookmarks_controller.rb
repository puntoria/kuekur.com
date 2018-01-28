class BookmarksController < ApplicationController
  before_filter :require_login

  def create
    event = find_event
    current_user.bookmark(event)

    flash[:success] = t(".success")

    redirect_to :back
  end

  def destroy
    event = find_event
    current_user.unbookmark(event)

    flash[:success] = t(".success")

    redirect_to :back
  end

  private

  def find_event
    Event.find(params[:event_id])
  end
end
