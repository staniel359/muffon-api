module LastFM
  module User
    class Plays
      class Play < LastFM::User::Plays
        include LastFM::Mixins::Track

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_play_data
          ]
        end

        def data
          Muffon::Formatter::Source::User::Plays::Play.call(
            source_original_link:,
            source_name:,
            source_track_id: nil,
            title:,
            artists:,
            album_title:,
            source_album_id: nil,
            image_data:,
            creation_date:
          )
        end

        def raw_track_data
          @args[:raw_play_data]
        end

        def artist_name
          raw_track_data.dig(
            'artist',
            '#text'
          )
        end

        def album_title
          raw_album_data['#text']
        end
      end
    end
  end
end
