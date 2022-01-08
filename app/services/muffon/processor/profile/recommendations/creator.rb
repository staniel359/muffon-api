module Muffon
  module Processor
    module Profile
      module Recommendations
        class Creator < Muffon::Processor::Profile::Recommendations::Base
          private

          def process_recommendations
            return if profile_artist.blank?

            similar_artists.each do |s|
              process_recommendation(s)
            end
          end

          def profile_artist
            @profile_artist ||=
              profile.profile_artists.find_by(
                id: @args[:profile_artist_id]
              )
          end

          def similar_artists
            similar_artists_data.dig(
              :artist, :similar
            ) || []
          end

          def similar_artists_data
            ::LastFM::Artist::Similar.call(
              artist: artist.name,
              limit: 250,
              minimal: true
            )
          end

          def artist
            @artist ||= profile_artist.artist
          end

          def process_recommendation(similar_artist)
            Muffon::Processor::Profile::Recommendation::Creator.call(
              artist_name: similar_artist[:name],
              profile_id: @args[:profile_id],
              profile_artist_id:
                @args[:profile_artist_id]
            )
          end
        end
      end
    end
  end
end
