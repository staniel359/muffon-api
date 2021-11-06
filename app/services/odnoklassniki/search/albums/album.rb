module Odnoklassniki
  module Search
    class Albums
      class Album < Odnoklassniki::Search::Albums
        include Odnoklassniki::Utils::Album

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
            id: id,
            source_id: SOURCE_ID,
            odnoklassniki_id: odnoklassniki_id,
            title: title,
            artist: artist_formatted,
            artists: artists,
            image: image_data,
            release_date: release_date
          }
        end

        def album
          @album ||= @args.album
        end
      end
    end
  end
end
