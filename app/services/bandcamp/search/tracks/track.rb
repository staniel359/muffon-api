module Bandcamp
  module Search
    class Tracks
      class Track < Bandcamp::Search::Base
        include Bandcamp::Mixins::Track

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_track_data
          ]
        end

        def data
          Muffon::Formatter::Source::Search::Tracks::Track.call(
            source_original_link:,
            source_name:,
            source_track_id: bandcamp_id,
            source_track_artist_id: artist_bandcamp_id,
            source_model: bandcamp_model,
            title:,
            artists:,
            image_data:,
            album_title:,
            source_album_id: album_bandcamp_id,
            source_album_artist_id: artist_bandcamp_id,
            duration:,
            is_audio_present: true,
            **self_args,
            **query_match_args
          )
        end

        def title
          raw_track_data['name']
        end

        def raw_track_data
          @args[:raw_track_data]
        end

        def source_original_link
          raw_track_data['item_url_path']
        end

        def bandcamp_id
          raw_track_data['id']
        end
      end
    end
  end
end
