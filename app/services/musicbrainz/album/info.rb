module MusicBrainz
  module Album
    class Info < MusicBrainz::Base
      MODEL_NAME = 'release'.freeze

      include MusicBrainz::Utils::Album

      def call
        super
      rescue RestClient::BadRequest
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
        album_base_data
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
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end

      alias album response_data
    end
  end
end
