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
          {
            title: title,
            discogs_id: discogs_id,
            artist: artist_formatted,
            artists: artists,
            image: image_data,
            release_date: release_date
          }
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
          @album ||= @args.album
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
