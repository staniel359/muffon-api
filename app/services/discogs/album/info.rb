module Discogs
  module Album
    class Info < Discogs::Album::Base
      private

      def album_data
        album_base_data.merge(album_extra_data)
      end

      def album_base_data
        {
          title: response_data['title'],
          artist: artist_data,
          source: 'discogs'
        }
      end

      def album_extra_data
        {
          images: images_data(main_image, 'album'),
          released: released,
          description: description_truncated,
          labels: labels,
          tags: tags,
          tracks: tracks_data
        }
      end

      def released
        response_data['released_formatted'].to_s
      end

      def labels
        response_data['labels'].map { |l| l['name'] }.uniq
      end

      def tags
        response_data.values_at(
          'genres', 'styles'
        ).flatten.compact.uniq
      end
    end
  end
end
