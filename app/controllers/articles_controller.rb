
class ArticlesController < ApplicationController

  around_filter :shopify_session

  def index
    @blog = ShopifyAPI::Blog.find(params[:blog_id])
    @articles = ShopifyAPI::Article.find(:all, :params => {:limit => 5, :order => "created_at DESC", :blog_id => params[:blog_id]})
  end

  def show
    @blog = ShopifyAPI::Blog.find(params[:blog_id])
    @article = ShopifyAPI::Article.find(params[:id], :params => { :blog_id => params[:blog_id]})
  end
  
  def update
    @blog = ShopifyAPI::Blog.find(params[:blog_id])
    @article = ShopifyAPI::Article.find(params[:id], :params => { :blog_id => params[:blog_id]})

    params[:shopify_api_article].keys.each do |k|

      puts "updating #{k} to #{params[:shopify_api_article][k]}"
      @article.published_at = params[:shopify_api_article][k].to_time
      @article.save
    end
    

    
    redirect_to "/blogs/#{params[:blog_id]}/articles/#{params[:id]}"



  end
  
  
  
end
