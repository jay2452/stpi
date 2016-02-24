class HomePagesController < ApplicationController
  def index
    @feeds = Feed.all.order(created_at: :desc).limit(10)
  end
end
