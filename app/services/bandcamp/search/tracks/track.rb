module Bandcamp
  module Search
    class Tracks
      class Track < Bandcamp::Search::Tracks
        def call
          data
        end

        private

        def data
          base_data.merge(extra_data)
        end

        def base_data
          {
            title: title,
            bandcamp_slug: bandcamp_slug,
            bandcamp_model: bandcamp_model,
            player_id: player_id,
            artist: artist_formatted,
            artists: artists
          }
        end

        def title
          model_title(@args.track)
        end

        def bandcamp_slug
          bandcamp_title_slug(@args.track)
        end

        def bandcamp_model
          bandcamp_model_name(@args.track)
        end

        def artists
          [artist_data_formatted(@args.track)]
        end

        def extra_data
          {
            album: album_formatted,
            albums: albums,
            image: image_data,
            audio: audio_data
          }
        end

        def albums
          @albums ||= [album_data_formatted].compact
        end

        def album_data_formatted
          return if album_title.blank?

          { title: album_title }
        end

        def album_title
          @album_title ||= description.match(
            /from the album (.+)/
          ).try(:[], 1)
        end

        def description
          @args.track[:description]
        end

        def image_data
          image_data_formatted(
            @args.track[:image], 'track'
          )
        end

        def audio_data
          { source_id: SOURCE_ID }
        end
      end
    end
  end
end
