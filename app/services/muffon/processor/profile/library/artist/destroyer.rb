module Muffon
  module Processor
    module Profile
      module Library
        module Artist
          class Destroyer < Muffon::Processor::Profile::Base
            private

            def required_args
              [
                *super,
                :library_id
              ]
            end

            def data
              library_artist_record.destroy!

              { success: true }
            end

            def library_artist_record
              profile_record
                .library_artists
                .find_by(
                  id: @args[:library_id]
                )
            end
          end
        end
      end
    end
  end
end
