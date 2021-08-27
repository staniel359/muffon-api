module Muffon
  module Profile
    class Recommendations
      class Clearer < Muffon::Profile::Recommendations
        def call
          return if not_all_args?

          update_recommendations
          delete_empty_recommendations
        end

        private

        def primary_args
          [
            @args.profile_id,
            @args.profile_artist_id
          ]
        end

        def update_recommendations
          recommendations.find_each do |rec|
            rec.profile_artist_ids -=
              [@args.profile_artist_id]
            rec.save
          end
        end

        def recommendations
          profile.recommendations.where(
            '? = ANY(ARRAY[profile_artist_ids])',
            @args.profile_artist_id
          )
        end

        def delete_empty_recommendations
          profile.recommendations.where(
            profile_artist_ids: []
          ).delete_all
        end
      end
    end
  end
end
