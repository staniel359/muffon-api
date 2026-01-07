module LastFM
  module User
    class Playlists
      class TotalCount < LastFM::User::Playlists
        PAGE_LIMIT = 20

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            pages_count
          ]
        end

        def data
          ((pages_count - 1) * PAGE_LIMIT) + remainder
        end

        def remainder
          response_data
            .css('.playlisting-playlists-item-wrap')
            .size
        end

        def params
          { page: pages_count }
        end

        def pages_count
          @args[:pages_count]
        end
      end
    end
  end
end
