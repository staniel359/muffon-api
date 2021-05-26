module LastFM
  module Artist
    class Albums
      class Album < LastFM::Artist::Albums
        include LastFM::Utils::Album

        def call
          data
        end

        private

        def data
          {
            title: title,
            image: image_data
          }
        end

        def album
          @album ||= @args.album
        end
      end
    end
  end
end
