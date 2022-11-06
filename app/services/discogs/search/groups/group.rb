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
          self_data
            .merge(group_base_data)
            .merge(group_extra_data)
        end

        def album
          @args[:group]
        end

        def group_base_data
          {
            source: source_data,
            title:,
            artist: artist_names_data,
            artists:
          }
        end

        def discogs_id
          album['master_id']
        end

        def discogs_model
          'group'
        end

        def title
          full_title[2]
        end

        def full_title
          @full_title ||=
            album['title'].match(
              /(.+) - (.+)/
            )
        end

        def artists
          [artist_data]
        end

        def artist_data
          { name: full_title[1] }
        end

        def group_extra_data
          {
            image: image_data,
            release_date:,
            listeners_count:
          }.compact
        end

        def image
          album['cover_image']
        end
      end
    end
  end
end
