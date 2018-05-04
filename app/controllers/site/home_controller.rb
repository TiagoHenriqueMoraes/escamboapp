class Site::HomeController < ApplicationController
  layout "site"
  def index
    @category = Category.order_by_description
    @ads = Ad.last_six
  end
end
