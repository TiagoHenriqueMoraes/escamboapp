class Site::HomeController < SiteController
  def index
    @category = Category.order_by_description
    @ads = Ad.last_six
  end
end
