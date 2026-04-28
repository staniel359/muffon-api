module Muffon
  module Processor
    module Profile
      module Listened
        module Album
          class Destroyer < Muffon::Processor::Profile::Base
            private

            def required_args
              [
                *super,
                :listened_id
              ]
            end

            def data
              listened_album_record.destroy!

              { success: true }
            end

            def listened_album_record
              profile_record
                .listened_albums
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
