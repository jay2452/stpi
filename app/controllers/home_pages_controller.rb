class HomePagesController < ApplicationController
  def index
    @feeds = Feed.all.order(created_at: :desc).limit(5)
  end

  def contact

  end

  # def search_results
  #   arr = []
  #   arr1 = []
  #
  #   @search_service = Service.search do
  #     fulltext params[:search]
  #   end
  #   @services = @search_service.results
  #
  #   arr << @services
  #
  #   @search_career = Career.search do
  #     fulltext params[:search]
  #   end
  #   @careers = @search_career.results
  #
  #   arr << @careers
  #
  #   @search_consultancy = Consultancy.search do
  #     fulltext params[:search]
  #   end
  #   @consultancies = @search_consultancy.results
  #   arr << @consultancies
  #
  #   @search_download = Download.search do
  #     fulltext params[:search]
  #   end
  #   @downloads = @search_download.results
  #   arr << @downloads
  #
  #   @search_faq = Faq.search do
  #     fulltext params[:search]
  #   end
  #   @faqs = @search_faq.results
  #
  #   arr << @faqs
  #
  #
  #   @search_feed = Feed.search do
  #     fulltext params[:search]
  #   end
  #   @feeds = @search_feed.results
  #   arr << @feeds
  #
  #   @search_gcell = Gcell.search do
  #     fulltext params[:search]
  #   end
  #   @gcells = @search_gcell.results
  #   arr << @gcells
  #
  #   @search_it_park = ItPark.search do
  #     fulltext params[:search]
  #   end
  #   @it_parks = @search_it_park.results
  #   arr << @it_parks
  #
  #   @search_mission = Mission.search do
  #     fulltext params[:search]
  #   end
  #   @missions = @search_mission.results
  #   arr << @missions
  #
  #   @search_tender = Tender.search do
  #     fulltext params[:search]
  #   end
  #   @tenders = @search_tender.results
  #   arr << @tenders
  #
  #   @search_sub_centers = SubCenter.search do
  #     fulltext params[:search]
  #   end
  #   @sub_centers = @search_sub_centers.results
  #   arr << @sub_centers
  #
  #   @search_policy = Policy.search do
  #     fulltext params[:search]
  #   end
  #   @policies = @search_policy.results
  #   arr << @policies
  #
  #   @arr1 = @services + @careers + @consultancies + @downloads + @it_parks + @faqs + @feeds + @gcells + @missions + @policies + @tenders + @sub_centers
  #
  #   puts "============================="
  #     p arr
  #   puts "============================="
  #
  #   puts "============================="
  #     p @arr1
  #   puts "============================="
  #
  #
  # end


end
