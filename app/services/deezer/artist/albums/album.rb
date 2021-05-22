module Deezer
  module Artist
    class Albums
      class Album < Deezer::Artist::Albums
        include Deezer::Utils::Album

        def call
          data
        end

        private

        def data
          {
            title: title,
            deezer_id: deezer_id,
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
