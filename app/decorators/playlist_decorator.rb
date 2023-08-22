module PlaylistDecorator
  extend ActiveSupport::Concern

  class_methods do
    def tracks_count_desc_ordered
      order(
        tracks_count: :desc,
        created_at: :asc
      )
    end

    def tracks_count_asc_ordered
      order(
        tracks_count: :asc,
        created_at: :asc
      )
    end

    def associated
      includes(
        image_association
      )
    end
  end

  private

  def eventable_data
    {
      id:,
      title:
    }
  end
end
