class HomePagesController < ApplicationController
  def index
    @feeds = Feed.all.order(created_at: :desc).limit(3)
  end

  def contact

  end

  def search_results
    @search = Service.search do
      fulltext params[:search]
    end
    @services = @search.results

    puts "============================="
      p @services
    puts "============================="
  end


end
