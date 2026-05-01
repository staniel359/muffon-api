module Odnoklassniki
  module Search
    class Artists
      class Artist < Odnoklassniki::Base
        include Odnoklassniki::Mixins::Artist

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
          Muffon::Formatter::Source::Search::Artists::Artist.call(
            source_original_link:,
            source_name:,
            source_artist_id: odnoklassniki_id,
            name:,
            image_data:,
            **self_args
          )
        end

        def raw_artist_data
          @args[:raw_artist_data]
        end
      end
    end
  end
end
