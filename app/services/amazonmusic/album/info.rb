module AmazonMusic
  module Album
    class Info < AmazonMusic::Album::Base
      private

      def album_data
        if @args[:is_list]
          album_list_data
        else
          album_full_data
        end
      end

      def album_list_data
        Muffon::Formatter::Source::Track::Albums::Album.call(
          source_original_link:,
          source_name:,
          source_album_id: amazonmusic_id,
          title:,
          artists:,
          image_data:,
          release_date:,
          **self_args
        )
      end

      def album_full_data
        Muffon::Formatter::Source::Album::Info.call(
          source_original_link:,
          source_name:,
          source_album_id: amazonmusic_id,
          title:,
          artists:,
          image_data:,
          release_date:,
          description: nil,
          tags: nil,
          tags_size: nil,
          plays_count: nil,
          labels: nil,
          tracks:,
          **self_args
        )
      end

      def request_payload
        {
          'operationName' => 'AlbumDetailPage',
          'variables' => {
            'id' => @args[:album_id],
            'isAuthenticated' => true,
            'includeMerch' => false,
            'includeAlbumAbout' => false
          },
          'extensions' => {
            'clientLibrary' => {
              'name' => '@apollo/client',
              'version' => '4.1.6'
            },
            'persistedQuery' => {
              'version' => 1,
              'sha256Hash' =>
                'b199df0b29a6679f8400a7d7663de253' \
                'd4241603b7ba86368bf862e5ddf9ec4e'
            }
          }
        }.to_json
      end

      def track_data_formatted(
        raw_track_data
      )
        AmazonMusic::Album::Tracks::Track.call(
          raw_track_data:,
          album_data: album_base_data,
          **self_args
        )
      end

      def album_base_data
        @album_base_data ||=
          Muffon::Formatter::Source::Track::Albums::Album.call(
            source_original_link:,
            source_name:,
            source_album_id: amazonmusic_id,
            title:,
            artists:,
            image_data:,
            release_date: nil
          )
      end
    end
  end
end
