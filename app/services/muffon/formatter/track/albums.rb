module Muffon
  module Formatter
    module Track
      class Albums < Muffon::Formatter::Track::Base
        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            source_original_link
            source_name
            source_track_id
            title
            artists
            albums
          ]
        end

        def data
          {
            source: source_data,
            title:,
            artist: artist_data,
            artists:,
            albums:
          }.compact
        end
      end
    end
  end
end
