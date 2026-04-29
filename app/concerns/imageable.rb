module Imageable
  extend ActiveSupport::Concern

  def process_image(
    image_file
  )
    Muffon::Processor::Image::Creator.call(
      model: model_name.name,
      model_id: id,
      image_file:
    )
  end

  def process_image_later(
    image_file
  )
    Muffon::Worker::Image::Creator.call(
      profile_id:,
      model: model_name.name,
      model_id: id,
      image_file:
    )
  end

  def process_images(
    image_files
  )
    Muffon::Processor::Images::Creator.call(
      model: model_name.name,
      model_id: id,
      image_files:
    )
  end

  def add_image!(
    image_file_data:
  )
    delete_image_later!

    image.attach(
      image_file_data
    )
  end

  def add_image_to_images!(
    image_file_data:
  )
    images.attach(
      image_file_data
    )
  end

  def delete_image_later!
    return unless with_image?

    image.purge_later
  end

  def delete_images_later!
    return unless with_images?

    images.purge_later
  end

  private

  def with_image?
    image.attached?
  end

  def with_images?
    images.attached?
  end
end
