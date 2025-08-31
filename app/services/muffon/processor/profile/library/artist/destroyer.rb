module Muffon
  module Processor
    module Profile
      module Library
        module Artist
          class Destroyer < Muffon::Processor::Profile::Library::Artist::Base
            private

            def required_args
              super + %i[
                library_id
              ]
            end

            def process_library_artist
              library_artist&.destroy

              { success: true }
            end

            def library_artist
              if instance_variable_defined?(
                :@library_artist
              )
                @library_artist
              else
                @library_artist =
                  profile
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
end
