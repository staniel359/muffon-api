module Discogs
  module Label
    class Albums
      class Album < Discogs::Label::Albums
        include Discogs::Utils::Album

        def call
          data
        end

        private

        def data
          {
            id: id,
            discogs_id: discogs_id,
            title: title,
            artists: artists,
            image: image_data,
            release_date: release_date
          }
        end

        def album
          @album ||= @args.album
        end

        def artists
          [artist_data_formatted]
        end

        def artist_data_formatted
          { name: album['artist'] }
        end

        def image
          album['thumb']
        end
      end
    end
  end
end
