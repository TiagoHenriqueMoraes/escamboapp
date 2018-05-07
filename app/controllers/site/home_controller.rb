class Site::HomeController < SiteController
  def index
    @category = Category.order_by_description
    @ads = Ad.descending_order(6)
  end
end
