class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @home_images = [
      "https://static.pexels.com/photos/2097/desk-office-pen-ruler.jpg",
      "https://static.pexels.com/photos/6224/hands-people-woman-working.jpg",
      "https://static.pexels.com/photos/26549/pexels-photo-26549.jpg",
      "https://static.pexels.com/photos/5305/coffee-cup-mug-desk.jpg",
      "https://static.pexels.com/photos/92961/pexels-photo-92961.jpeg",
      "https://static.pexels.com/photos/5251/coffee-cup-mug-desk.jpg",
      "https://static.pexels.com/photos/6409/pencils-crayons-crayon-colored-pencils.jpg"
    ]
    @campaigns = Campaign.all
    @latest_campaigns = Campaign.latest(3)
    if User.of_the_month.respond_to?('first')
      @user_of_the_month = User.of_the_month.first.id
    else
      @user_of_the_month = User.of_the_month.id
    end
  end
end
