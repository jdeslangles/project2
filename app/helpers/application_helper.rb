module ApplicationHelper

  def randomized_background_image
    images = ["assetsbackground1.jpg", "assets/background2.jpg", "assets/background3.jpg", "assets/background4.jpg", "assets/background5.jpg", "assets/background6.jpg", "assets/background7.jpg"]
    images[rand(images.size)]
  end



end
