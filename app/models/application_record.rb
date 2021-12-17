class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  class << self
    def created_desc_ordered
      order(
        created_at: :desc
      )
    end

    def created_asc_ordered
      order(
        created_at: :asc
      )
    end

    def profile_tracks_count_desc_ordered
      order(
        profile_tracks_count: :desc
      )
    end

    def image_association
      { image_attachment: image_attachment_association }
    end

    def images_association
      { images_attachments: image_attachment_association }
    end

    private

    def image_attachment_association
      {
        blob: {
          variant_records: {
            image_attachment: :blob
          }
        }
      }
    end
  end

  def image_data
    image_data_formatted(
      image
    )
  end

  def images_data
    images.map do |i|
      image_data_formatted(i)
    end
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
  rescue OpenURI::HTTPError
    nil
  end

  def process_images(image_files)
    return if image_files.blank?

    images.purge

    return if image_files == 'DELETED'

    image_files.each do |i|
      images.attach(
        **image_file_data_formatted(i)
      )
    end
  rescue OpenURI::HTTPError
    nil
  end

  def tracks
    Track.where(
      id: track_ids
    ).associated
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
