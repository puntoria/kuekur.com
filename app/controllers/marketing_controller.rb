class MarketingController < ApplicationController
  def index
    # sort_by
    # default_order
    @events = case params[:order_by] ? params[:order_by] : 'upcoming'
              when 'upcoming'
                landing_page.upcoming_events
              when 'newest'
                landing_page.recently_published_events
              end
  end

  private

  def landing_page
    LandingPage.new
  end

end
