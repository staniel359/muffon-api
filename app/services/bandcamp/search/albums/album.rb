module Bandcamp
  module Search
    class Albums
      class Album < Bandcamp::Search::Albums
        include Bandcamp::Utils::Album

        def call
          data
        end

        private

        def data
          muffon_data
            .merge(album_data)
        end

        def title
          model_title(
            album
          )
        end

        def album
          @args[:album]
        end

        def artist_name
          artist_data[:name]
        end

        def artist_data
          model_artist_data(
            album
          )
        end

        def album_data
          {
            source: source_data,
            title:,
            artist: artist_names_data,
            artists:,
            image: image_data,
            listeners_count:
          }.compact
        end

        def source_data
          {
            name: source_name,
            slug: bandcamp_slug,
            artist_slug: artist_bandcamp_slug,
            model: bandcamp_model
          }
        end

        def bandcamp_slug
          model_title_slug(
            album
          )
        end

        def artist_bandcamp_slug
          artist_data.dig(
            :source, :slug
          )
        end

        def bandcamp_model
          model_name(
            album
          )
        end

        def image_data
          image_data_formatted(
            album[:image]
          )
        end
      end
    end
  end
end
