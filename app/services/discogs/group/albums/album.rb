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

        def album_data
          {
            source_id: SOURCE_ID,
            discogs_id: discogs_id,
            title: title,
            image: image_data,
            release_date: release_date
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
