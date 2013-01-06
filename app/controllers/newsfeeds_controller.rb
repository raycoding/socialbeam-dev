class NewsfeedsController < ApplicationController
  
  def index
  @newsfeeds_streams = Newsfeed.paginate :per_page => 20, :order => "created_at DESC", :page => params[:page]
  end

  #def refresh
  #@socialbeam_streams = SocialbeamStream.paginate :per_page => 20, :order => "updated_at DESC", :page => params[:page]
  #respond_to do |format|
    
  #end

end
