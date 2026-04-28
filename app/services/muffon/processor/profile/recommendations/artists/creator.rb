module Muffon
  module Processor
    module Profile
      module Recommendations
        module Artists
          class Creator < Muffon::Processor::Profile::Recommendations::Base
            SIMILAR_ARTISTS_LIMIT = 200

            private

            def required_args
              [
                *super,
                :library_artist_id
              ]
            end

            def data
              return if library_artist_record.blank?

              similar_artists.each do |similar_artist|
                process_recommendation(
                  similar_artist
                )
              end
            end

            def library_artist_record
              if defined?(@library_artist_record)
                @library_artist_record
              else
                @library_artist_record =
                  profile_record
                  .library_artists
                  .find_by(
                    id: @args[:library_artist_id]
                  )
              end
            end

            def similar_artists
              @similar_artists ||= begin
                ::LastFM::Artist::Similar.call(
                  artist_name:,
                  limit: SIMILAR_ARTISTS_LIMIT,
                  is_minimal: true
                ).dig(
                  :artist,
                  :similar
                )
              rescue Muffon::Error::NotFoundError
                []
              end
            end

            def artist_name
              artist_record.name
            end

            def artist_record
              @artist_record ||= library_artist_record.artist
            end

            def process_recommendation(
              raw_similar_artist_data
            )
              artist_name =
                raw_similar_artist_data[:name]

              Muffon::Processor::Profile::Recommendation::Artist::Creator.call(
                artist_name:,
                profile_id: @args[:profile_id],
                library_artist_id: library_artist_record.id
              )
            end
          end
        end
      end
    end
  end
end
