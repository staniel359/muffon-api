module Muffon
  module Utils
    module API
      class Service < Muffon::Base
        EXCEPTIONS = {
          'lastfm/artist/album' => 'lastfm/album',
          'lastfm/artist/track' => 'lastfm/track',
          'bandcamp/artist/album' => 'bandcamp/album',
          'bandcamp/artist/track' => 'bandcamp/track',
          'spotify/artist/album' => 'spotify/album',
          'spotify/artist/track' => 'spotify/track'
        }.freeze

        def call
          data
        end

        private

        def data
          "#{folder_name}/#{@args[:action]}"
            .camelize
            .safe_constantize
        end

        def folder_name
          EXCEPTIONS[controller_name] || controller_name
        end

        def controller_name
          @args[:controller]
            .remove('api/v1/')
            .split('/')
            .map(&:singularize)
            .join('/')
        end
      end
    end
  end
end
