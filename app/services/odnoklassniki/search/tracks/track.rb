module Odnoklassniki
  module Search
    class Tracks
      class Track < Odnoklassniki::Search::Tracks
        include Odnoklassniki::Mixins::Track

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_track_data
            raw_albums
          ]
        end

        def data
          Muffon::Formatter::Source::Search::Tracks::Track.call(
            source_original_link:,
            source_name:,
            source_track_id: odnoklassniki_id,
            title:,
            artists:,
            album_title:,
            source_album_id: album_odnoklassniki_id,
            image_data:,
            duration:,
            is_audio_present: audio_present?,
            **query_match_args,
            **self_args
          )
        end

        def raw_track_data
          @args[:raw_track_data]
        end

        def album_id
          raw_track_data['albumId']
        end

        def raw_album_data
          @args[:raw_albums].find do |raw_album_data|
            raw_album_data['id'] == album_id
          end
        end

        def image_url
          raw_track_data['imageUrl']
        end
      end
    end
  end
end
