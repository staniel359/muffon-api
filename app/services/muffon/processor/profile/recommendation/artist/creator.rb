module Muffon
  module Processor
    module Profile
      module Recommendation
        module Artist
          class Creator < Muffon::Processor::Profile::Recommendation::Base
            include Muffon::Mixins::Artist

            private

            def required_args
              [
                *super,
                :artist_name
              ]
            end

            def data
              recommendation_record

              recommendation_record.library_artist_ids |=
                [@args[:library_artist_id]]

              recommendation_record.save!
            end

            def recommendation_record
              @recommendation_record ||=
                profile_record
                .recommendation_artists
                .where(
                  artist_id: artist_record.id
                )
                .first_or_initialize
            end

            def name
              @args[:artist_name]
            end
          end
        end
      end
    end
  end
end
