module Muffon
  module Profile
    class Recommendations
      class Creator < Muffon::Profile::Recommendations
        def call
          return if not_all_args?

          create_recommendations
        end

        private

        def primary_args
          [
            @args[:profile_id],
            @args[:profile_artist_id]
          ]
        end

        def create_recommendations
          return if find_profile_artist.blank?

          process_recommendations
        end

        def find_profile_artist
          @find_profile_artist ||=
            profile.profile_artists.find_by(
              id: @args[:profile_artist_id]
            )
        end

        def process_recommendations
          similar.each do |s|
            process_recommendation(s)
          end
        end

        def similar
          @similar ||= ::LastFM::Artist::Similar.call(
            artist: artist_name,
            limit: 200,
            minimal: true
          ).dig(:artist, :similar) || []
        end

        def artist_name
          find_profile_artist
            .artist
            .name
        end

        def process_recommendation(similar)
          Muffon::Profile::Recommendation::Creator.call(
            artist_name: similar[:name],
            profile_id: @args[:profile_id],
            profile_artist_id: @args[:profile_artist_id]
          )
        end
      end
    end
  end
end
