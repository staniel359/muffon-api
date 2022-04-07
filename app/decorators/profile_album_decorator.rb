module ProfileAlbumDecorator
  module ClassMethods
    def associated
      includes(
        :album,
        [profile_artist: :artist],
        image_association
      )
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end
end
