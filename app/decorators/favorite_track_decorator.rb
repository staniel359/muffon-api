module FavoriteTrackDecorator
  extend ActiveSupport::Concern

  class_methods do
    def associated
      includes(
        :album,
        [{ track: :artist }],
        image_association
      )
    end
  end
end
