module Genius
  module Artist
    class Albums
      class Album < Genius::Artist::Albums
        include Genius::Utils::Album

        def call
          data
        end

        private

        def data
          {
            title: title,
            genius_id: genius_id,
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
