module LastFM
  module Artist
    class Similar
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
          update_artist_record!

          Muffon::Formatter::Source::Artist::SimilarArtists::Artist.call(
            source_original_link:,
            source_name:,
            source_artist_id: nil,
            name:,
            image_data:,
            is_minimal: @args[:is_minimal],
            **self_args
          )
        end

        def name
          raw_artist_data['name']
        end

        def raw_artist_data
          @args[:raw_artist_data]
        end

        def image_url
          raw_artist_data.dig('image', 0, '#text') ||
            raw_artist_data['image']
        end
      end
    end
  end
end
