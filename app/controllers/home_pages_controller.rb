class HomePagesController < ApplicationController
  def index
    @feeds = Feed.all.order(created_at: :desc).limit(5)
  end

  def contact

  end

  def search_results
    arr = []
    arr1 = []
    q = params[:q]
    @search_service_title = Service.search(title_cont: q)
    @search_service_content = Service.search(content_cont: q)
    @services = @search_service_title.result + @search_service_content.result

    arr << @services

    @search_career = Career.search(content_cont: q)
    @careers = @search_career.result

    arr << @careers

    @search_consultancy = Consultancy.search(content_cont: q)
    @consultancies = @search_consultancy.result

    arr << @consultancies

    @search_download = Download.search(title_cont: q)
    @downloads = @search_download.result

    arr << @downloads

    @search_faq = Faq.search(content_cont: q)
    @faqs = @search_faq.result

    arr << @faqs


    @search_feed = Feed.search(topic_cont: q)
    @feeds = @search_feed.result

    arr << @feeds

    @search_gcell = Gcell.search(content_cont: q)
    @gcells = @search_gcell.result

    arr << @gcells

    @search_it_park = ItPark.search(content_cont: q)
    @it_parks = @search_it_park.result

    arr << @it_parks

    @search_mission = Mission.search(content_cont: q)
    @missions = @search_mission.result

    arr << @missions

    @search_tender = Tender.search(content_cont: q)
    @tenders = @search_tender.result

    arr << @tenders

    @search_sub_centers = SubCenter.search(content_cont: q)
    @sub_centers = @search_sub_centers.result

    arr << @sub_centers

    @search_policy = Policy.search(content_cont: q)
    @policies = @search_policy.result

    arr << @policies

    @arr1 = @services + @careers + @consultancies + @downloads + @it_parks + @faqs + @feeds + @gcells + @missions + @policies + @tenders + @sub_centers

    puts "============================="
      p arr
    puts "============================="

    puts "============================="
      p @arr1
    puts "============================="


  end


end
