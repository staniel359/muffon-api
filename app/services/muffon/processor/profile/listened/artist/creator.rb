module Muffon
  module Processor
    module Profile
      module Listened
        module Artist
          class Creator < Muffon::Processor::Profile::Base
            include Muffon::Mixins::Artist

            private

            def required_args
              [
                *super,
                :artist_name
              ]
            end

            def data
              listened_artist_record

              { listened_artist: listened_artist_data }
            end

            def listened_artist_record
              @listened_artist_record ||=
                profile_record
                .listened_artists
                .where(
                  artist_id: artist_record.id
                )
                .first_or_create!
            end

            def name
              @args[:artist_name]
            end

            def listened_artist_data
              { id: listened_artist_record.id }
            end
          end
        end
      end
    end
  end
end
