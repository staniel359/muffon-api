module Muffon
  module Processor
    module Profile
      module Library
        module Album
          class Destroyer < Muffon::Processor::Profile::Base
            private

            def required_args
              [
                *super,
                :library_id
              ]
            end

            def data
              library_album_record.destroy!

              { success: true }
            end

            def library_album_record
              profile_record
                .library_albums
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
