# encoding: utf-8

class PhotoPictureUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def image
    @image ||= MiniMagick::Image.open( model.send(mounted_as).path )
  end

  def image_width
     image[:width]
  end

  def image_height
    image[:height]
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
      process :resize_to_fit => [940, 940]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fill => [100, 100]
  end
  version :detail do
    process :resize_to_fit => [500, 500]
  end
  # version :photowall do
  #   process :resize_to_fit => [960, 960]
  # end

protected

    def resize_to_fit(width, height)
      manipulate! do |img|
        img.resize "#{width}x#{height}"
        img = yield(img) if block_given?
        img
      end
    end

    def resize_to_limit(width, height)
      manipulate! do |img|
        img.resize "#{width}x#{height}>"
        img = yield(img) if block_given?
        img
      end
    end

    def resize(width, height, gravity = 'Center')
      manipulate! do |img|
        img.combine_options do |cmd|
          cmd.resize "#{width}"
          if img[:width] < img[:height]
            cmd.gravity gravity
            cmd.background "rgba(255,255,255,0.0)"
            cmd.extent "#{width}x#{height}"
          end
        end
        img = yield(img) if block_given?
        img
      end
    end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
