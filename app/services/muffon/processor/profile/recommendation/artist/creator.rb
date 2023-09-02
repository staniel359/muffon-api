module Muffon
  module Processor
    module Profile
      module Recommendation
        module Artist
          class Creator < Muffon::Processor::Profile::Base
            include Muffon::Utils::Artist

            def call
              process_recommendation
            end

            private

            def process_recommendation
              recommendation

              add_library_artist

              recommendation.save
            end

            def recommendation
              @recommendation ||=
                profile
                .recommendation_artists
                .where(
                  artist_id: find_artist.id
                ).first_or_initialize
            end

            def name
              @args[:artist_name]
            end

            def add_library_artist
              return if library_artist_present?

              recommendation.library_artist_ids <<
                @args[:library_artist_id]
            end

            def library_artist_present?
              @args[:library_artist_id].in?(
                recommendation.library_artist_ids
              )
            end
          end
        end
      end
    end
  end
end
