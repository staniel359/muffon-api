module Genius
  module Search
    class Albums
      class Album < Genius::Search::Albums
        include Genius::Mixins::Album

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
          Muffon::Formatter::Search::Albums::Album.call(
            source_original_link:,
            source_name:,
            source_album_id: genius_id,
            title:,
            artists:,
            image_data:,
            release_date:,
            **self_args
          )
        end

        def raw_album_data
          @args[:raw_album_data]['result']
        end
      end
    end
  end
end
