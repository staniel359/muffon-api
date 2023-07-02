module Discogs
  module Utils
    module Album
      MODELS = {
        album: 'release',
        group: 'master'
      }.freeze

      include Muffon::Utils::Album

      private

      def title
        album['title']
      end

      def source_data
        {
          name: source_name,
          id: discogs_id,
          model: discogs_model,
          links: source_links
        }
      end

      def discogs_id
        album['id']
      end

      def discogs_model
        'album'
      end

      def original_link
        'https://www.discogs.com' \
          "/#{model_formatted}/#{discogs_id}"
      end

      def model_formatted
        MODELS[
          discogs_model.to_sym
        ]
      end

      def image_data
        image_data_formatted(
          image
        )
      end

      def release_date
        date_formatted(
          raw_release_date
        )
      end

      def raw_release_date
        album['year'].to_s
      end
    end
  end
end
