module Discogs
  module Search
    class Albums
      class Album < Discogs::Search::Albums
        include Discogs::Utils::Album

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

        def title
          full_title[2]
        end

        def full_title
          @full_title ||=
            album['title'].match(
              /(.+) - (.+)/
            )
        end

        def artists
          [artist_data]
        end

        def artist_data
          { name: full_title[1] }
        end

        def image
          album['cover_image']
        end
      end
    end
  end
end
