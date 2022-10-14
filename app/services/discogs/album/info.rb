module Discogs
  module Album
    class Info < Discogs::Album::Base
      private

      def album_data
        muffon_data
          .merge(album_base_data)
          .merge(album_extra_data)
          .merge(with_more_data)
      end

      def album_base_data
        {
          source: source_data,
          title:,
          artist: artist_names_data,
          artists:
        }
      end

      def album_extra_data
        {
          image: image_data,
          profiles_count:,
          release_date:,
          description:
            description_truncated,
          labels:,
          tags: tags_truncated,
          tracks:
        }.compact
      end

      def raw_release_date
        album['released']
      end

      def labels
        album['labels'].pluck(
          'name'
        ).uniq
      end

      def label_source_data(label)
        {
          name: source_name,
          id: label['id']
        }
      end
    end
  end
end
