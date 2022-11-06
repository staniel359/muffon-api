class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  include Muffon::Utils::ErrorHandlers
  include Muffon::Utils::ImageProcessing
  include ApplicationRecordDecorator

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

  private

  def update_artist_tags
    artist.update_tags
  end
end
