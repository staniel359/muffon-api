module Bandcamp
  module Search
    class Tracks
      class Track < Bandcamp::Search::Tracks
        include Bandcamp::Utils::Track

        def call
          data
        end

        private

        def data
          self_data
            .merge(track_base_data)
            .merge(track_extra_data)
        end

        def title
          model_title(
            track
          )
        end

        def track
          @args[:track]
        end

        def artist_name
          artist_data[:name]
        end

        def artist_data
          model_artist_data(
            track
          )
        end

        def track_base_data
          {
            source: source_data,
            player_id:,
            title:,
            artist: artist_names_data,
            artists:
          }
        end

        def source_data
          {
            name: source_name,
            slug: bandcamp_slug,
            artist_slug:
              artist_bandcamp_slug,
            model: bandcamp_model
          }
        end

        def bandcamp_slug
          model_title_slug(
            track
          )
        end

        def artist_bandcamp_slug
          artist_data.dig(
            :source, :slug
          )
        end

        def bandcamp_model
          model_name(
            track
          )
        end

        def track_extra_data
          {
            album: album_data,
            image: image_data
          }.compact
        end

        def album_data
          return if album_title.blank?

          {
            source: album_source_data,
            title: album_title
          }
        end

        def album_source_data
          { name: 'lastfm' }
        end

        def album_title
          @album_title ||=
            track[:description].match(
              /from the album (.+)/
            ).try(:[], 1)
        end

        def image_data
          image_data_formatted(
            track[:image]
          )
        end
      end
    end
  end
end
