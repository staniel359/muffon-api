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
            profile_artists_count:,
            profile_artists: profile_artists_formatted
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

        def profile_artists_count
          recommendation
            .profile_artist_ids
            .size
        end

        def profile_artists_formatted
          profile_artists.map do |a|
            profile_artist_formatted(a)
          end
        end

        def profile_artists
          recommendation
            .profile_artists
            .profile_tracks_count_desc_ordered
            .profile_albums_count_desc_ordered
            .created_asc_ordered
            .limit(5)
            .associated
        end

        def profile_artist_formatted(profile_artist)
          Muffon::Profile::Recommendation::Artists::Artist.call(
            profile_artist:
          )
        end
      end
    end
  end
end
