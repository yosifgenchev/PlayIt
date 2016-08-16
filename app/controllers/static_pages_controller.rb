class StaticPagesController < ApplicationController
  def help
  	if logged_in?
        @picture = current_user.picture.url
        @userName = current_user.name

        @hasPicture = !@picture.nil?
     end
  end

  def contacts
  	if logged_in?
        @picture = current_user.picture.url
        @userName = current_user.name

        @hasPicture = !@picture.nil?
     end
  end
end
