module FavoriteTrackDecorator
  module ClassMethods
    def associated
      includes(
        :album,
        [track: :artist],
        image_association
      )
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end
end
