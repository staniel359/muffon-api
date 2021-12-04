class ProfilePost < ApplicationRecord
  belongs_to :profile
  belongs_to :other_profile, class_name: 'Profile'

  has_many_attached :images

  def process_images(image_files)
    return if image_files.blank?

    images.purge

    return if image_files == 'DELETED'

    image_files.each do |i|
      images.attach(
        **image_file_data_formatted(i)
      )
    end
  end

  def images_data
    images.map do |i|
      image_data_formatted(i)
    end
  end

  def tracks
    Track.where(
      id: track_ids
    )
  end
end
