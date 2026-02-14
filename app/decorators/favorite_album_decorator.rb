module FavoriteAlbumDecorator
  extend ActiveSupport::Concern

  class_methods do
    def associated
      includes(
        [{ album: :artist }],
        image_association
      )
    end
  end
end
