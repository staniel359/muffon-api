module RateYourMusic
  module Artist
    class Albums < Muffon::Base
      include Muffon::Paginated

      def call
        return handlers.bad_request if not_all_args?
        return handlers.not_found if wrong_artist_id?
        return handlers.bad_request if wrong_album_type?
        return handlers.not_found if no_data?

        data
      end

      private

      def primary_args
        [@args.artist_id, @args.album_type]
      end

      def wrong_artist_id?
        @args.artist_id.to_i.to_s != @args.artist_id
      end

      def wrong_album_type?
        album_type_code.blank?
      end

      def album_type_code
        album_type_codes[album_type.to_sym]
      end

      def album_type
        @args.album_type.downcase.strip
      end

      def album_type_codes
        {
          album: 's', ep: 'e',
          single: 'i', live: 'l',
          compilation: 'c',
          appearance: 'a',
          unofficial: 'b',
          various: 'v',
          video: 'd'
        }
      end

      def no_data?
        response_matched_data.blank?
      end

      def response_matched_data
        @response_matched_data ||= response.match(
          matched_block_regexp
        ).try(:[], 1)
      end

      def response
        RestClient.post(link, payload, headers)
      end

      def link
        "https://rateyourmusic.com/httprequest/#{action}"
      end

      def action
        'ExpandDiscographySection'
      end

      def payload
        {
          artist_id: @args.artist_id,
          action: action,
          type: album_type_code,
          sort: 'release_date.a',
          show_appearances: 'false'
        }
      end

      def headers
        { cookies: cookies }
      end

      def cookies
        {
          sec_bs: '566989052d497161dc086e1fcde53ee3',
          sec_id: 'bd0797c7f90da39e6dda610b5827ad97',
          sec_ts: '1620159431',
          ulv: secrets.rateyourmusic[:session_id]
        }
      end

      def matched_block_regexp
        %r{<div id="disco_type_#{album_type_code}">(.+)</div>}
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        {
          page: page,
          total_pages: total_pages,
          albums: albums_data
        }
      end

      def albums_data
        paginated_collection.map { |a| album_data(a) }
      end

      def collection_list
        Nokogiri::HTML.parse(
          response_matched_data
        ).css('.disco_release')
      end

      def album_data(album)
        RateYourMusic::Artist::Albums::Album.call(
          album: album
        )
      end
    end
  end
end
