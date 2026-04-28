module Muffon
  module Processor
    module Profile
      module Library
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
              library_artist_record

              { library_artist: library_artist_data }
            end

            def library_artist_record
              @library_artist_record ||=
                profile_record
                .library_artists
                .where(
                  artist_id: artist_record.id
                )
                .first_or_create!
            end

            def name
              @args[:artist_name]
            end

            def library_artist_data
              { id: library_artist_record.id }
            end
          end
        end
      end
    end
  end
end
