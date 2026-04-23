module Bandcamp
  module Search
    class Artists
      class Artist < Bandcamp::Search::Base
        include Bandcamp::Mixins::Artist

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_artist_data
          ]
        end

        def data
          Muffon::Formatter::Search::Artists::Artist.call(
            source_original_link:,
            source_name:,
            source_artist_id: bandcamp_id,
            source_model: bandcamp_model,
            name:,
            image_data:,
            **self_args
          )
        end

        def raw_artist_data
          @args[:raw_artist_data]
        end

        def image_url
          raw_artist_data['img']
        end
      end
    end
  end
end
