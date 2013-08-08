module ApplicationHelper

  def randomized_background_image
    # images = "assets/background0.jpg"
    images = 1.upto(7).map{ |n| "assets/background#{n}.jpg"}
    images[rand(images.size)]
  end



end
