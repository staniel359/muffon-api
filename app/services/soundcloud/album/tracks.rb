module SoundCloud
  module Album
    class Tracks < SoundCloud::Album::Base
      PAGE_LIMIT = 50

      include SoundCloud::Mixins::Album

      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          raw_album_data
          album_data
        ]
      end

      def album_data
        { tracks: }
      end

      def raw_tracks
        return [] if raw_raw_tracks.blank?

        raw_tracks_unsorted.sort_by do |raw_track_data|
          tracks_ids.index(
            raw_track_data['id']
          )
        end
      end

      def raw_tracks_unsorted
        tracks_ids_paginated.flat_map do |page_tracks_ids|
          raw_page_tracks(
            page_tracks_ids
          )
        end
      end

      def raw_raw_tracks
        raw_album_data['tracks']
      end

      def raw_album_data
        @args[:raw_album_data]
      end

      def tracks_ids_paginated
        tracks_ids
          .each_slice(PAGE_LIMIT)
          .to_a
      end

      def tracks_ids
        @tracks_ids ||= raw_raw_tracks.pluck('id')
      end

      def raw_page_tracks(
        page_tracks_ids
      )
        params = {
          **request_params,
          ids: page_tracks_ids.join(',')
        }

        Muffon::Request.call(
          url: request_url,
          method: 'GET',
          params:,
          proxy: request_proxy
        )
      end

      def request_url
        "#{REQUEST_BASE_URL}/tracks"
      end

      def track_data_formatted(
        raw_track_data
      )
        SoundCloud::Album::Tracks::Track.call(
          raw_track_data:,
          album_data: @args[:album_data],
          **self_args
        )
      end
    end
  end
end
