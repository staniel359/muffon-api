module Odnoklassniki
  module Artist
    class Albums
      class Album < Odnoklassniki::Artist::Albums
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
            source_id: SOURCE_ID,
            odnoklassniki_id:,
            title:,
            image: image_data,
            release_date:,
            listeners_count:
          }.compact
        end

        def album
          @args[:album]
        end
      end
    end
  end
end
