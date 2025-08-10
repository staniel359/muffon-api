module LastFM
  module Artist
    class Info
      class Recommendation < LastFM::Artist::Info
        def call
          return if return?

          data
        end

        private

        def return?
          test? ||
            not_all_args? ||
            no_data? ||
            !valid_profile?
        end

        def primary_args
          [
            @args[:profile_id],
            @args[:token]
          ]
        end

        def no_data?
          find_recommendation.blank? ||
            find_recommendation.deleted
        end

        def data
          {
            id: find_recommendation.id,
            artists_count:
          }
        end

        def find_recommendation
          if instance_variable_defined?(
            :@find_recommendation
          )
            @find_recommendation
          else
            @find_recommendation =
              profile
              .recommendation_artists
              .find_by(
                artist_id: find_artist.id
              )
          end
        end

        def name
          @args[:artist_name]
        end

        def artists_count
          find_recommendation
            .library_artist_ids
            .size
        end
      end
    end
  end
end
