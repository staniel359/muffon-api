module Discogs
  module Search
    class Groups
      class Group < Discogs::Search::Groups
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
          @album ||= @args.group
        end

        def discogs_id
          album['master_id']
        end

        def image
          album['cover_image']
        end
      end
    end
  end
end
