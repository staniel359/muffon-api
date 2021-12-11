module Muffon
  module Profile
    module Recommendation
      class Artists < Muffon::Profile::Base
        COLLECTION_NAME = 'profile_artists'.freeze
        include Muffon::Utils::Pagination

        private

        def primary_args
          [
            @args[:profile_id],
            @args[:token],
            @args[:recommendation_id]
          ]
        end

        def no_data?
          recommendation.blank?
        end

        def recommendation
          @recommendation ||=
            profile.recommendations.find_by(
              id: @args[:recommendation_id]
            )
        end

        def data
          return forbidden if wrong_profile?

          { recommendation: paginated_data }
        end

        def total_items_count
          recommendation
            .profile_artist_ids
            .size
        end

        def collection_list
          profile_artists_associated
            .limit(limit)
            .offset(offset)
        end

        def profile_artists_associated
          recommendation
            .profile_artists
            .includes(:artist)
        end

        def collection_item_data_formatted(profile_artist)
          Muffon::Profile::Recommendation::Artists::Artist.call(
            profile_artist: profile_artist
          )
        end
      end
    end
  end
end
