module Discogs
  module Album
    class Info < Discogs::Album::Base
      private

      def album_data
        album_base_data
          .merge(album_extra_data)
          .merge(with_more_data)
      end

      def album_base_data
        {
          title: title,
          artist: artist_data(response_data),
          source: 'discogs'
        }
      end

      def album_extra_data
        {
          image: image_data(main_image, 'album'),
          released: released,
          description: description_truncated,
          labels: labels,
          tags: tags.first(5),
          tracks: tracks_data
        }
      end

      def released
        response_data['released_formatted'].to_s
      end

      def labels
        response_data['labels'].map { |l| l['name'] }.uniq
      end
    end
  end
end
