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
          muffon_data
            .merge(group_base_data)
            .merge(group_extra_data)
        end

        def group_base_data
          {
            source_id: SOURCE_ID,
            discogs_id:,
            discogs_type: 'group',
            title:,
            artists:
          }
        end

        def title
          full_title[2]
        end

        def album
          @args[:group]
        end

        def full_title
          @full_title ||=
            album['title'].match(
              /(.+) - (.+)/
            )
        end

        def artists_list
          [{ 'name' => full_title[1] }]
        end

        def discogs_id
          album['master_id']
        end

        def group_extra_data
          {
            image: image_data,
            release_date:
          }.compact
        end

        def image
          album['cover_image']
        end
      end
    end
  end
end
