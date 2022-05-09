module RateYourMusic
  module Artist
    class Albums < RateYourMusic::Artist::Base
      ACTION = 'ExpandDiscographySection'.freeze
      COLLECTION_NAME = 'albums'.freeze
      ALBUM_TYPES = {
        album: 's',
        ep: 'e',
        single: 'i',
        live: 'l',
        compilation: 'c',
        appearance: 'a',
        unofficial: 'b',
        various: 'v',
        video: 'd'
      }.freeze
      include Muffon::Utils::Pagination

      def call
        return bad_request if wrong_album_type?

        super
      end

      private

      def primary_args
        [
          @args[:artist_id],
          @args[:album_type]
        ]
      end

      def wrong_album_type?
        album_type.blank?
      end

      def album_type
        ALBUM_TYPES[
          album_type_formatted
        ]
      end

      def album_type_formatted
        return if @args[:album_type].blank?

        @args[:album_type]
          .downcase
          .strip
          .to_sym
      end

      def payload
        {
          artist_id: @args[:artist_id],
          action: ACTION,
          type: album_type,
          sort: 'release_date.a',
          show_appearances: 'false'
        }
      end

      def total_items_count
        albums_list.size
      end

      def albums_list
        response_data.css(
          '.disco_release'
        )
      end

      def response_data
        @response_data ||=
          Nokogiri::HTML.parse(
            response
          )
      end

      def collection_list
        collection_paginated(
          albums_list
        )
      end

      def collection_item_data_formatted(album)
        RateYourMusic::Artist::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id]
        )
      end

      alias artist_data paginated_data
    end
  end
end
