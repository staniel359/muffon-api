module MusicBrainz
  module Album
    class Info < MusicBrainz::Base
      MODEL_NAME = 'release'.freeze

      include MusicBrainz::Utils::Album

      def call
        super
      rescue Faraday::BadRequestError
        not_found
      end

      private

      def primary_args
        [@args[:album_id]]
      end

      def link
        "#{BASE_LINK}/release/#{@args[:album_id]}"
      end

      def params
        super
          .merge(album_params)
      end

      def album_params
        { inc: 'artist-credits+tags+labels+recordings' }
      end

      def data
        { album: album_data }
      end

      def album_data
        return album_list_data if @args[:list]

        album_full_data
      end

      def album_list_data
        self_data
          .merge(album_base_data)
          .merge(album_list_extra_data)
      end

      def album_full_data
        self_data
          .merge(album_base_data)
          .merge(album_extra_data)
          .merge(with_more_data)
      end

      def album_base_data
        @album_base_data ||= {
          source: source_data,
          title:,
          artist: artists_minimal_data,
          artists:,
          image: image_data
        }.compact
      end

      def album_list_extra_data
        {
          release_date:,
          listeners_count:
        }.compact
      end

      def album_extra_data
        {
          listeners_count:,
          release_date:,
          labels:,
          tags: tags_truncated,
          tracks:
        }.compact_blank
      end

      def labels_list
        album['label-info']
      end

      def label_data_formatted(label)
        label.dig(
          'label', 'name'
        )
      end

      def track_data_formatted(track)
        MusicBrainz::Album::Info::Track.call(
          track:,
          album_data: album_base_data,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end

      alias album response_data
    end
  end
end
