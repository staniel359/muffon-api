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
          muffon_data
            .merge(album_data)
        end

        def album_data
          {
            source_id: SOURCE_ID,
            discogs_id: discogs_id,
            title: title,
            artist: artist_formatted,
            artists: artists,
            image: image_data,
            release_date: release_date
          }.compact
        end

        def title
          full_title[2]
        end

        def full_title
          @full_title ||= album['title'].match(
            /(.+) - (.+)/
          )
        end

        def album
          @args[:album]
        end

        def artists_list
          [{ 'name' => full_title[1] }]
        end

        def image
          album['cover_image']
        end
      end
    end
  end
end
