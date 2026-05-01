module LastFM
  module Artist
    class Info
      class Recommendation < LastFM::Base
        include Muffon::Mixins::Profile

        def call
          return if return?

          data
        end

        private

        def required_args
          %i[
            profile_id
            token
          ]
        end

        def return?
          args_missing? ||
            profile_record.blank? ||
            recommendation_record.blank? ||
            recommendation_record.deleted? ||
            forbidden?
        end

        def deleted?
          recommendation_record.deleted
        end

        def recommendation_record
          if defined?(@recommendation_record)
            @recommendation_record
          else
            @recommendation_record =
              profile_record
              .recommendation_artists
              .find_by(
                artist_id: artist_record.id
              )
          end
        end

        def name
          @args[:artist_name]
        end

        def forbidden?
          !valid_profile?
        end

        def data
          {
            id: recommendation_record.id,
            artists_count: recommendation_record.artists_count
          }
        end
      end
    end
  end
end
