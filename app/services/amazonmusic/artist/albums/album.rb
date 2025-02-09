module AmazonMusic
  module Artist
    class Albums
      class Album < AmazonMusic::Artist::Albums
        include AmazonMusic::Utils::Album

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
            release_date:
          }.compact
        end
      end
    end
  end
end
