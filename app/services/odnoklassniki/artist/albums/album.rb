module Odnoklassniki
  module Artist
    class Albums
      class Album < Odnoklassniki::Artist::Albums
        include Odnoklassniki::Utils::Album

        def call
          data
        end

        private

        def data
          self_data
            .merge(album_data)
        end

        def album
          @args[:album]
        end

        def album_data
          {
            source: source_data,
            title:,
            artist: artists_minimal_data,
            artists:,
            image: image_data,
            release_date:,
            listeners_count:
          }.compact
        end
      end
    end
  end
end
