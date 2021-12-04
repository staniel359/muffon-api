class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def image_data
    image_data_formatted(image)
  end

  def process_image(image_file)
    return if image_file.blank?

    image.purge

    return if image_file == 'DELETED'

    image.attach(
      **image_file_data_formatted(
        image_file
      )
    )
  end

  def errors_formatted
    errors.map do |e|
      { e.attribute => e.type }
    end
  end

  private

  def image_data_formatted(image)
    Muffon::Utils::Image.call(
      image: image
    )
  end

  def image_file_data_formatted(image_file)
    Muffon::Utils::ImageFile.call(
      image: image_file
    )
  end
end
