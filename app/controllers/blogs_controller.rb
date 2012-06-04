
class BlogsController < ApplicationController

  around_filter :shopify_session

  def index
    @blogs = ShopifyAPI::Blog.find(:all, :params => {:order => "created_at DESC" })
  end

  def show
    @blog = ShopifyAPI::Blog.find(params[:id])
  end


end
