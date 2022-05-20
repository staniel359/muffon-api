class ApplicationRecord < ActiveRecord::Base
  include Muffon::Utils::ErrorHandlers
  include Muffon::Utils::ImageProcessing
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

  private

  def add_artist_tags
    Artist::Tags::UpdaterWorker.perform_async(
      artist_tags_worker_args
    )
  end

  def artist_tags_worker_args
    {
      name: artist.name
    }.to_json
  end
end
