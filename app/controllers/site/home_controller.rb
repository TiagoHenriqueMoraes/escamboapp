class Site::HomeController < ApplicationController
  layout "site"
  def index
    @category = Category.all
  end
end
