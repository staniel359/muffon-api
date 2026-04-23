module Bandcamp
  module Label
    class Albums
      class Album < Bandcamp::Label::Base
        include Bandcamp::Mixins::Album

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
          Muffon::Formatter::Label::Albums::Album.call(
            source_original_link:,
            source_name:,
            source_album_id: bandcamp_id,
            source_album_artist_id: artist_bandcamp_id,
            source_model: bandcamp_model,
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
