class HomePagesController < ApplicationController
  def index
    @feeds = Feed.all.order(created_at: :desc).limit(3)
  end

  def contact

  end
end
