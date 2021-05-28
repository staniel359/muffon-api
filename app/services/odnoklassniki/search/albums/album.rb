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
          {
            title: title,
            odnoklassniki_id: odnoklassniki_id,
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
