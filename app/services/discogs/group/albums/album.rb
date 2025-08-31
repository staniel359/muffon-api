module Discogs
  module Group
    class Albums
      class Album < Discogs::Group::Albums
        include Discogs::Utils::Album

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            album
          ]
        end

        def data
          {
            source: source_data,
            title:,
            image: image_data,
            release_date:
          }.compact
        end

        def album
          @args[:album]
        end

        def image
          album['thumb']
        end

        def raw_release_date
          album['released']
        end
      end
    end
  end
end
