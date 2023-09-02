module Muffon
  module Processor
    module Profile
      module Recommendations
        module Artists
          class Creator <
              Muffon::Processor::Profile::Recommendations::Artists::Base
            SIMILAR_ARTISTS_LIMIT = 200

            private

            def process_recommendations
              return if library_artist.blank?

              similar_artists.each do |s|
                process_recommendation(s)
              end
            end

            def library_artist
              @library_artist ||=
                profile
                .library_artists
                .find_by(
                  id: @args[:library_artist_id]
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
                limit:
                  SIMILAR_ARTISTS_LIMIT,
                minimal: true
              )
            end

            def artist
              @artist ||= library_artist.artist
            end

            def process_recommendation(similar_artist)
              Muffon::Worker::Profile::Recommendation::Artist::Creator.call(
                artist_name: similar_artist[:name],
                profile_id: @args[:profile_id],
                library_artist_id:
                  @args[:library_artist_id]
              )
            end
          end
        end
      end
    end
  end
end
