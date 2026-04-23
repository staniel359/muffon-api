module LastFM
  module Search
    class Tracks
      class Track < LastFM::Search::Tracks
        include LastFM::Mixins::Track

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
          update_record_data!

          Muffon::Formatter::Search::Tracks::Track.call(
            source_original_link:,
            source_name:,
            source_track_id: nil,
            title:,
            artists:,
            is_with_artist_image: true,
            album_title:,
            source_album_id: nil,
            image_data:,
            duration:,
            is_audio_present: audio_present?,
            **self_args
          )
        end

        def raw_track_data
          @args[:raw_track_data]
        end

        def artist_name
          raw_track_data['artist']
        end
      end
    end
  end
end
