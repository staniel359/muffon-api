module LibraryArtistDecorator
  module ClassMethods
    def library_albums_count_desc_ordered
      order(
        library_albums_count: :desc
      )
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end
end
