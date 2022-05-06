module LibraryAlbumDecorator
  module ClassMethods
    def associated
      includes(
        :album,
        [library_artist: :artist],
        image_association
      )
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end
end
