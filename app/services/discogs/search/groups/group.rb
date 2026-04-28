module Discogs
  module Search
    class Groups
      class Group < Discogs::Search::Groups
        include Discogs::Mixins::AlbumGroup

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_album_group_data
          ]
        end

        def data
          raw_album_group_data['artists'] = [
            {
              'name' => raw_artist_name
            }
          ]

          Muffon::Formatter::Source::Search::AlbumGroups::AlbumGroup.call(
            source_original_link:,
            source_name:,
            source_album_group_id: discogs_id,
            source_model: discogs_model,
            title:,
            artists:,
            image_data:,
            release_date:,
            **self_args
          )
        end

        def raw_album_group_data
          @args[:raw_album_group_data]
        end

        def raw_artist_name
          full_title[1]
        end

        def full_title
          raw_album_group_data['title'].match(
            /(.+) - (.+)/
          )
        end

        def title
          full_title[2]
        end

        def discogs_id
          raw_album_group_data['master_id']
        end

        def image_url
          raw_album_group_data['cover_image']
        end
      end
    end
  end
end
