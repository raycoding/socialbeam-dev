class BrowseController < ApplicationController
  
  before_filter :update_scribblestreams, :only => [:home, :refreshscribbles]
  
  def home
  end

 def votedup
 @scribble = Scribble.find(params[:id])
 @scribble.ups=@scribble.ups+1
 @scribble.save
 render :text => "<div class='up'></div>"+@scribble.ups.to_s+" likes"
 end

 def voteddown
 @scribble = Scribble.find(params[:id])
 @scribble.downs=@scribble.downs+1
 @scribble.save
 render :text => "<div class='down'></div>"+@scribble.downs.to_s+" dislikes"
 end
  
  def refreshscribbles
  render :partial => 'scribbles.html.erb', :locals => { :scribbles_streams => @scribbles_streams }
  end

  protected
  def update_scribblestreams
  @scribbles_streams = Scribble.order('created_at DESC').all
  end 
end
