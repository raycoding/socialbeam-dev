class BrowseController < ApplicationController

  before_filter :update_scribblestreams, :only => [:home, :refreshscribbles]
  before_filter :update_newsfeedsstream, :only => [:home]
  
  def home
  end

  def votedup
   @scribble = Scribble.find(params[:id])
   @scribble.ups=@scribble.ups+1
   @scribble.save
   render :text => "<i class='icon-thumbs-up'></i>"+@scribble.ups.to_s+" likes"
 end

 def voteddown
   @scribble = Scribble.find(params[:id])
   @scribble.downs=@scribble.downs+1
   @scribble.save
   render :text => "<i class='icon-thumbs-down'></i>"+@scribble.downs.to_s+" dislikes"
 end

 def refreshscribbles
  render :partial => 'scribbles/scribbles.html.erb', :locals => { :scribbles_streams => @scribbles_streams }
end

protected
def update_scribblestreams
  @scribbles_streams = Scribble.order('created_at DESC').all
end 
def update_newsfeedsstream
  @newsfeeds_streams = Newsfeed.paginate :per_page => 20, :order => "created_at DESC", :page => params[:page]
end
end
