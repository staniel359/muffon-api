module Muffon
  module Processor
    module Profile
      module Bookmarks
        module Album
          class Destroyer < Muffon::Processor::Profile::Bookmarks::Base
            private

            def required_args
              super + %i[
                bookmark_id
              ]
            end

            def process_bookmark
              bookmark_album&.destroy

              { success: true }
            end

            def bookmark_album
              if instance_variable_defined?(
                :@bookmark_album
              )
                @bookmark_album
              else
                @bookmark_album =
                  profile
                  .bookmark_albums
                  .find_by(
                    id: @args[:bookmark_id]
                  )
              end
            end
          end
        end
      end
    end
  end
end
