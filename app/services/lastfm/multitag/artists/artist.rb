module LastFM
  module Multitag
    class Artists
      class Artist < LastFM::Multitag::Artists
        include LastFM::Mixins::Artist

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
          Muffon::Formatter::Multitag::Artists::Artist.call(
            artist_record:,
            source_original_link:,
            source_name:,
            source_artist_id: nil,
            name:,
            image_data:,
            **self_args
          )
        end

        def artist_record
          @args[:raw_artist_data]
        end

        def name
          artist_record.name
        end
      end
    end
  end
end
