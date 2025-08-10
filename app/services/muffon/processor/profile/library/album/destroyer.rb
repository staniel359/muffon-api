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

            def process_library_album
              library_album&.destroy

              { success: true }
            end

            def library_album
              if instance_variable_defined?(
                :@library_album
              )
                @library_album
              else
                @library_album =
                  profile
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
end
