class ApplicationController < ActionController::Base
  include Authentication

  def home_page
    baskets = Basket.all.filter{ |p| p.date > Time.now}.sort_by{|p| p.date}
    @next_basket = baskets ? baskets.first : nil
  end
  
end
