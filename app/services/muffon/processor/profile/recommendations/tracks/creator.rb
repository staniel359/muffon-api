module Muffon
  module Processor
    module Profile
      module Recommendations
        module Tracks
          class Creator <
              Muffon::Processor::Profile::Recommendations::Tracks::Base
            SIMILAR_TRACKS_LIMIT = 200

            private

            def process_recommendations
              return if library_track.blank?

              similar_tracks.each do |s|
                process_recommendation(s)
              end
            end

            def library_track
              @library_track ||=
                profile
                .library_tracks
                .find_by(
                  id: @args[:library_track_id]
                )
            end

            def similar_tracks
              similar_tracks_data.dig(
                :track, :similar
              ) || []
            end

            def similar_tracks_data
              ::LastFM::Track::Similar.call(
                artist_name:,
                track_title:,
                limit:
                  SIMILAR_TRACKS_LIMIT,
                minimal: true
              )
            end

            def artist_name
              track
                .artist
                .name
            end

            def track
              @track ||= library_track.track
            end

            def track_title
              track.title
            end

            def process_recommendation(similar_track)
              Muffon::Worker::Profile::Recommendation::Track::Creator.call(
                artist_name:
                  similar_track[:artist][:name],
                track_title:
                  similar_track[:title],
                profile_id: @args[:profile_id],
                library_track_id:
                  @args[:library_track_id]
              )
            end
          end
        end
      end
    end
  end
end
