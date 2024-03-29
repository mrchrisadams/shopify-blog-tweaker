class HomeController < ApplicationController
  
  around_filter :shopify_session, :except => 'welcome'
  
  def welcome
    current_host = "#{request.host}#{':' + request.port.to_s if request.port != 80}"
    @callback_url = "http://#{current_host}/login/finalize"
  end
  
  def index
    # get 5 products
    # @products = ShopifyAPI::Product.find(:all, :params => {:limit => 10})

    # get latest 5 orders
    # @orders   = ShopifyAPI::Order.find(:all, :params => {:limit => 5, :order => "created_at DESC" })

    # get latest 5 orders
    @blogs   = ShopifyAPI::Blog.find(:all, :params => {:limit => 5, :order => "created_at DESC" })

  end
  
end