module VK
  module Utils
    module Audio
      class Playlist < VK::Base
        KEY_LINK_REGEX =
          /#EXT-X-KEY:METHOD=AES-128,URI="(.+)"/
        BASE_LINK_REGEX = /(.+)index.m3u8/
        FRAGMENT_PATH_REGEX = /([\w\-]+\.ts[?\w\-=&]*)/

        def call
          return if not_all_args?

          data
        end

        private

        def primary_args
          [@args[:link]]
        end

        def data
          {
            key:,
            base_link:,
            fragments_paths:
          }
        end

        def key
          RestClient.get(
            key_link
          ).body
        end

        def key_link
          response_data.match(
            KEY_LINK_REGEX
          )[1]
        end

        def response_data
          @response_data ||=
            RestClient.get(
              @args[:link]
            ).body
        end

        def base_link
          @args[:link].match(
            BASE_LINK_REGEX
          )[1]
        end

        def fragments_paths
          response_data.scan(
            FRAGMENT_PATH_REGEX
          ).flatten
        end
      end
    end
  end
end
