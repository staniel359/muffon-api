module LastFM
  module Artist
    module API
      class Base < LastFM::API::Base
        private

        def service_info
          {
            api_method: 'artist.getInfo',
            response_data_node: 'artist'
          }
        end

        def params
          super.merge(artist_params)
        end

        def primary_args
          [@args.artist]
        end

        def data
          { artist: artist_data }
        end

        def extra_data
          response_data['@attr']
        end
      end
    end
  end
end
