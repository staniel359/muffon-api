module Muffon
  module Processor
    module Profile
      module Library
        module Album
          class Destroyer < Muffon::Processor::Profile::Library::Album::Base
            private

            def primary_args
              super + [
                @args[:library_id]
              ]
            end

            def process_profile_album
              profile_album&.destroy

              { success: true }
            end

            def profile_album
              @profile_album ||=
                profile.profile_albums.find_by(
                  id: @args[:library_id]
                )
            end
          end
        end
      end
    end
  end
end
