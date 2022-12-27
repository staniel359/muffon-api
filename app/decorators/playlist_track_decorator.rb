module PlaylistTrackDecorator
  module ClassMethods
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

  def self.included(base)
    base.extend ClassMethods
  end
end
