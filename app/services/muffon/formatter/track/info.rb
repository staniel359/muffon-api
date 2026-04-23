module Muffon
  module Formatter
    module Track
      class Info < Muffon::Formatter::Track::Base
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
            album_title
            source_album_id
            image_data
            release_date
            duration
            description
            description_size
            tags
            tags_size
            plays_count
            is_audio_present
            audio_link
          ]
        end

        def data
          {
            **base_data,
            **extra_data
          }.compact
        end

        def base_data
          {
            **self_data,
            source: source_data,
            player_id: player_source_id,
            title:,
            artist: artist_data,
            artists:,
            album: album_data,
            image: image_data
          }
        end

        def extra_data
          {
            release_date:,
            duration:,
            description: description_computed,
            tags: tags_computed,
            listeners_count:,
            plays_count:,
            profiles_count:,
            audio: audio_data,
            lyrics: lyrics_computed,
            albums:,
            **with_more_data
          }
        end
      end
    end
  end
end
