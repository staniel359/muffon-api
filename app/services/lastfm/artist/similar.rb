module LastFM
  module Artist
    class Similar < LastFM::Artist::Base
      API_METHOD = 'artist.getSimilar'.freeze
      COLLECTION_NAME = 'similar'.freeze
      TOTAL_LIMIT = 200

      include LastFM::Artist::Utils::Pagination

      private

      def not_found?
        super ||
          name.blank?
      end

      def artist
        response_data['similarartists']
      end

      def params
        {
          **super,
          artist:
            @args[:artist_name],
          limit: TOTAL_LIMIT
        }
      end

      def name
        artist.dig(
          '@attr',
          'artist'
        )
      end

      def data
        { artist: artist_data }
      end

      def collection_list
        collection_paginated(
          raw_collection_list
        )
      end

      def raw_collection_list
        artist['artist']
      end

      def total_items_count
        raw_collection_list.size
      end

      def collection_item_data_formatted(artist)
        LastFM::Artist::Similar::Artist.call(
          artist:,
          profile_id: @args[:profile_id],
          token: @args[:token],
          minimal: @args[:minimal]
        )
      end
    end
  end
end
