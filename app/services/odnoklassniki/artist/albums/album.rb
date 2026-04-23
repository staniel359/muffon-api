module Odnoklassniki
  module Artist
    class Albums
      class Album < Odnoklassniki::Artist::Albums
        include Odnoklassniki::Mixins::Album

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_album_data
          ]
        end

        def data
          Muffon::Formatter::Artist::Albums::Album.call(
            source_original_link:,
            source_name:,
            source_album_id: odnoklassniki_id,
            title:,
            artists:,
            image_data:,
            release_date:,
            **self_args
          )
        end

        def raw_album_data
          @args[:raw_album_data]
        end
      end
    end
  end
end
