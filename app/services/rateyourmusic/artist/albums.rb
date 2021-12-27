module RateYourMusic
  module Artist
    class Albums < RateYourMusic::Artist::Base
      ACTION = 'ExpandDiscographySection'.freeze
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
      COLLECTION_NAME = 'albums'.freeze
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
        @album_type ||= ALBUM_TYPES[
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

      def no_data?
        response_matched_data.blank? ||
          page_out_of_bounds?
      end

      def response_matched_data
        @response_matched_data ||=
          response.match(
            matched_block_regexp
          ).try(:[], 1)
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

      def matched_block_regexp
        %r{<div id="disco_type_#{album_type}">(.+)</div>}
      end

      def total_items_count
        albums_list.size
      end

      def albums_list
        @albums_list ||=
          response_data.css(
            '.disco_release'
          )
      end

      def response_data
        Nokogiri::HTML.parse(
          response_matched_data
        )
      end

      def collection_list
        collection_paginated(
          albums_list
        )
      end

      def collection_item_data_formatted(album)
        RateYourMusic::Artist::Albums::Album.call(
          album: album,
          profile_id: @args[:profile_id]
        )
      end

      alias artist_data paginated_data
    end
  end
end
