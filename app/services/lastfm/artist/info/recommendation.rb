module LastFM
  module Artist
    class Info
      class Recommendation < LastFM::Artist::Info
        def call
          data
        end

        private

        def data
          return if no_recommendation?

          {
            id: recommendation_id,
            profile_artists_count:
              recommendation_profile_artists_count
          }
        end

        def no_recommendation?
          @args[:profile_id].blank? ||
            find_recommendation.blank? ||
            find_recommendation.deleted
        end

        def find_recommendation
          @find_recommendation ||=
            profile.recommendations.find_by(
              artist_id: artist_id
            )
        end

        def artist_id
          find_artist.id
        end

        def name
          @args[:artist_name]
        end

        def recommendation_id
          find_recommendation.id
        end

        def recommendation_profile_artists_count
          find_recommendation
            .profile_artist_ids
            .size
        end
      end
    end
  end
end
