module Discogs
  module Group
    class Info < Discogs::Group::Base
      private

      def group_data
        muffon_data
          .merge(group_base_data)
          .merge(group_extra_data)
          .merge(with_more_data)
      end

      def group_base_data
        {
          source_id: SOURCE_ID,
          title: title,
          artist: artist_formatted,
          artists: artists
        }
      end

      def group_extra_data
        {
          image: image_data,
          release_date: release_date,
          description: description_truncated,
          tags: tags.first(5),
          tracks: tracks
        }
      end
    end
  end
end
