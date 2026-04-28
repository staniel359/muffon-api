module LastFM
  module Top
    class Artists
      class Artist < LastFM::Top::Artists
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
          Muffon::Formatter::Source::Top::Artists::Artist.call(
            source_original_link:,
            source_name:,
            source_artist_id: nil,
            name:,
            image_data: artist_record.image_data,
            is_minimal: @args[:is_minimal],
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
