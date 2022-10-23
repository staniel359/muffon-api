module Muffon
  module Profile
    class Recommendations
      class Recommendation < Muffon::Profile::Recommendations
        include Muffon::Utils::Artist

        def call
          data
        end

        private

        def data
          muffon_data
            .merge(recommendation_data)
        end

        def recommendation_data
          {
            id: recommendation.id,
            name:,
            image: artist.image_data,
            artists_count:,
            artists: library_artists_formatted
          }.compact
        end

        def recommendation
          @args[:recommendation]
        end

        def name
          artist.name
        end

        def artist
          @artist ||= recommendation.artist
        end

        def artists_count
          recommendation
            .library_artist_ids
            .size
        end

        def library_artists_formatted
          library_artists.map do |a|
            library_artist_formatted(a)
          end
        end

        def library_artists
          recommendation
            .library_artists
            .library_tracks_count_desc_ordered
            .limit(5)
        end

        def library_artist_formatted(library_artist)
          Muffon::Profile::Recommendation::Artists::Artist.call(
            library_artist:
          )
        end
      end
    end
  end
end
