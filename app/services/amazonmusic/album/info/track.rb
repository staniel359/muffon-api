module AmazonMusic
  module Album
    class Info
      class Track < AmazonMusic::Album::Info
        include AmazonMusic::Utils::Track

        def call
          data
        end

        private

        def data
          self_data
            .merge(track_base_data)
            .merge(track_extra_data)
        end

        def track
          @args[:track]
        end

        def track_base_data
          {
            source: source_data,
            player_id: player_source_id,
            title:,
            artist: artists_minimal_data,
            artists:
          }
        end

        def title
          track['primaryText']
        end

        def artist_name
          track.dig(
            'contextMenu', 'options', 0,
            'onItemSelected', 1,
            'template', 'headerPrimaryText'
          )
        end

        def artist_amazonmusic_slug
          track.dig(
            'contextMenu', 'options', 1,
            'onItemSelected', 2, 'template',
            'templateData', 'deeplink'
          )
        end

        def track_extra_data
          {
            album: album_data,
            image: image_data,
            duration:,
            audio: audio_minimal_data
          }.compact
        end

        def album_data
          @args[:album_data]
        end

        def image_data
          album_data[:image]
        end
      end
    end
  end
end
