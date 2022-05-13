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
          muffon_data
            .merge(album_data)
        end

        def album
          @args[:album]
        end

        def album_data
          {
            source: source_data,
            title:,
            image: image_data,
            release_date:
          }.compact
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
