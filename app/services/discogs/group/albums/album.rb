module Discogs
  module Group
    class Albums
      class Album < Discogs::Group::Albums
        include Discogs::Utils::Album

        def call
          data
        end

        private

        def data
          {
            title: title,
            discogs_id: discogs_id,
            image: image_data,
            release_date: release_date
          }
        end

        def album
          @album ||= @args.album
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
