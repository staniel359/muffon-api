module Muffon
  module Processor
    module Profile
      module Recommendations
        module Tracks
          class Creator < Muffon::Processor::Profile::Recommendations::Base
            SIMILAR_TRACKS_LIMIT = 200

            private

            def required_args
              [
                *super,
                :library_track_id
              ]
            end

            def data
              return if library_track_record.blank?

              similar_tracks.each do |similar_track|
                process_recommendation(
                  similar_track
                )
              end
            end

            def library_track_record
              if defined?(@library_track_record)
                @library_track_record
              else
                @library_track_record =
                  profile_record
                  .library_tracks
                  .find_by(
                    id: @args[:library_track_id]
                  )
              end
            end

            def similar_tracks
              @similar_tracks ||= begin
                ::LastFM::Track::Similar.call(
                  artist_name:,
                  track_title:,
                  limit: SIMILAR_TRACKS_LIMIT,
                  is_minimal: true
                ).dig(
                  :track,
                  :similar
                )
              rescue Muffon::Error::NotFoundError
                []
              end
            end

            def artist_name
              track_record
                .artist
                .name
            end

            def track_record
              @track_record ||= library_track_record.track
            end

            def track_title
              track_record.title
            end

            def process_recommendation(
              raw_similar_track_data
            )
              artist_name =
                raw_similar_track_data.dig(
                  :artist,
                  :name
                )

              track_title =
                raw_similar_track_data[:title]

              Muffon::Processor::Profile::Recommendation::Track::Creator.call(
                artist_name:,
                track_title:,
                profile_id: @args[:profile_id],
                library_track_id: library_track_record.id
              )
            end
          end
        end
      end
    end
  end
end
