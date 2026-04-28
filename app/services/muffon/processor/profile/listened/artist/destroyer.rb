module Muffon
  module Processor
    module Profile
      module Listened
        module Artist
          class Destroyer < Muffon::Processor::Profile::Base
            private

            def required_args
              [
                *super,
                :listened_id
              ]
            end

            def data
              listened_artist_record.destroy!

              { success: true }
            end

            def listened_artist_record
              profile_record
                .listened_artists
                .find_by(
                  id: @args[:listened_id]
                )
            end
          end
        end
      end
    end
  end
end
