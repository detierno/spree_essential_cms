class PageController < Spree::BaseController

  before_filter :get_page, :only => :index
  
  
  def show
  end
    
  private
  
    def get_page
      @page = Page.active.find_by_path(page_path)
      return raise ActionController::RoutingError.new(page_path) unless @page
    end
      
    def page_path
      params[:path] || "/"
    end
    
    def collection
      params[:search] ||= {}
      @search = Post.metasearch(params[:search])
      @collection = @search.page(params[:page]).per(Spree::Config[:orders_per_page])
    end
        
end
