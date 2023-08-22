module PlaylistTrackDecorator
  extend ActiveSupport::Concern

  class_methods do
    def associated
      includes(
        :track,
        :artist,
        :album,
        image_association
      )
    end
  end

  delegate :profile_id, to: :playlist
end
