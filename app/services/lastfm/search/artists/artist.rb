module LastFM
  module Search
    class Artists
      class Artist < LastFM::Base
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
          update_record_data!

          Muffon::Formatter::Source::Search::Artists::Artist.call(
            source_original_link:,
            source_name:,
            source_artist_id: nil,
            name:,
            image_data: artist_record.image_data,
            **self_args
          )
        end

        def raw_artist_data
          @args[:raw_artist_data]
        end

        def raw_listeners_count
          raw_artist_data['listeners']
        end
      end
    end
  end
end
