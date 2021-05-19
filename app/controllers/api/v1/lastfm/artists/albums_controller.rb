module API
  module V1
    module LastFM
      module Artists
        class AlbumsController < ArtistsController
          def info
            render_data_with_status
          end

          def description
            render_data_with_status
          end

          def tags
            render_data_with_status
          end

          def listeners_count
            render_data_with_status
          end
        end
      end
    end
  end
end
