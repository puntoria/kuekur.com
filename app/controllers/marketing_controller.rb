class MarketingController < ApplicationController
  def index
    # Temporary Workaround.
    @events = case default_order
      when 'upcoming'
        landing_page.upcoming_events
      when 'newest'
        landing_page.recently_published_events
      end
  end

  private

  def default_order
    params[:order_by] ? params[:order_by] : 'upcoming'
  end

  def landing_page
    LandingPage.new
  end

end
