module Discogs
  module Search
    class Artists
      class Artist < Discogs::Search::Artists
        include Discogs::Utils::Artist

        def call
          data
        end

        private

        def data
          {
            name: name,
            discogs_id: discogs_id,
            image: image_data
          }
        end

        def artist
          @artist ||= @args.artist
        end

        def image
          artist['cover_image']
        end
      end
    end
  end
end
