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
            image: image_data,
            release_date: release_date
          }
        end

        def album
          @album ||= @args.album
        end

        def image
          album['cover_image']
        end
      end
    end
  end
end
