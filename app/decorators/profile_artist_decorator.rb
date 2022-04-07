module ProfileArtistDecorator
  module ClassMethods
    def profile_albums_count_desc_ordered
      order(
        profile_albums_count: :desc
      )
    end

    def associated
      includes(
        artist: image_association
      )
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end
end
