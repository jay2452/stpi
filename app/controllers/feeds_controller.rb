class FeedsController < ApplicationController
  def index
    @feeds = Feed.all.order(created_at: :desc)
  end

  def show
  end
end
