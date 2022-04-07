class ApplicationRecord < ActiveRecord::Base
  include Muffon::Utils::ErrorHandlers
  include ApplicationRecordDecorator
  self.abstract_class = true

  class << self
    private

    def image_association
      {
        image_attachment:
          image_attachment_association
      }
    end

    def image_attachment_association
      {
        blob: {
          variant_records: {
            image_attachment: :blob
          }
        }
      }
    end

    def images_association
      {
        images_attachments:
          image_attachment_association
      }
    end

    def clear_cache
      ActiveRecord::Base
        .connection
        .clear_query_cache
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
    images.purge

    image_files&.each do |i|
      images.attach(
        **image_file_data_formatted(i)
      )
    end
  rescue OpenURI::HTTPError
    nil
  end

  private

  def image_file_data_formatted(image_file)
    Muffon::Utils::ImageFile.call(
      image: image_file
    )
  end
end
