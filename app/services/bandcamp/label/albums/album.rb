module Bandcamp
  module Label
    class Albums
      class Album < Bandcamp::Label::Albums
        include Bandcamp::Utils::Album

        def call
          data
        end

        private

        def data
          {
            id: id,
            bandcamp_id: bandcamp_id,
            bandcamp_model: bandcamp_model,
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
