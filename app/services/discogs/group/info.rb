module Discogs
  module Group
    class Info < Discogs::Group::Base
      private

      def data
        { group: group_data }
      end

      def group_data
        group_base_data.merge(group_extra_data)
      end

      def group_base_data
        {
          id: album_id(artist_name(response_data), title, 'group'),
          title: title,
          artist: artist_data(response_data),
          source: 'discogs'
        }
      end

      def group_extra_data
        {
          images: images_data(main_image, 'album'),
          released: response_data['year'].to_s,
          description: description_truncated,
          tracks: tracks_data
        }
      end
    end
  end
end
