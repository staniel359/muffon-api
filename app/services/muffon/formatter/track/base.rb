module Muffon
  module Formatter
    module Track
      class Base < Muffon::Formatter::Base
        include Muffon::Mixins::Track

        private

        def title
          @args[:title]
        end

        def source_data
          return if local_track?

          {
            name: source_name,
            id: source_track_id,
            slug: source_track_slug,
            artist_id: source_track_artist_id,
            album_id: source_track_album_id,
            model: source_model,
            links: source_links_data
          }.compact
        end

        def local_track?
          !!@args[:is_local]
        end

        def source_name
          @args[:source_name]
        end

        def source_track_id
          @args[:source_track_id]
        end

        def source_track_slug
          @args[:source_track_slug]
        end

        def source_track_artist_id
          @args[:source_track_artist_id]
        end

        def source_track_album_id
          @args[:source_track_album_id]
        end

        def source_model
          @args[:source_model]
        end

        def source_streaming_link
          Muffon::Formatter::StreamingLink.call(
            model: 'track',
            source_name:,
            source_model_id: source_track_id
          )
        end

        def artists
          @args[:artists]
        end

        def image_data
          @args[:image_data]
        end

        def album_data
          return if album_title.blank? || local_track?

          {
            source: album_source_data,
            title: album_title,
            model: album_model
          }.compact
        end

        def album_title
          @args[:album_title]
        end

        def album_source_data
          {
            name: source_name,
            id: source_album_id,
            slug: source_album_slug,
            artist_id: source_album_artist_id,
            owner_id: source_album_owner_id,
            access_key: source_album_access_key
          }.compact
        end

        def source_album_id
          @args[:source_album_id]
        end

        def source_album_slug
          @args[:source_album_slug]
        end

        def source_album_artist_id
          @args[:source_album_artist_id]
        end

        def source_album_owner_id
          @args[:source_album_owner_id]
        end

        def source_album_access_key
          @args[:source_album_access_key]
        end

        def album_model
          @args[:album_model]
        end

        def duration
          @args[:duration]
        end

        def audio_data
          {
            present: audio_present?,
            link: audio_link
          }
            .compact
            .presence
        end

        def audio_present?
          @args[:is_audio_present]
        end

        def audio_link
          @args[:audio_link]
        end

        def lyrics_computed
          return if lyrics.blank?

          if lyrics_size.present?
            lyrics_truncated
          else
            lyrics
          end
        end

        def lyrics
          @args[:lyrics]
        end

        def lyrics_size
          @args[:lyrics_size]
        end

        def lyrics_truncated
          text_truncated(
            lyrics,
            size: lyrics_size
          )
        end

        def albums
          @args[:albums]
        end

        def release_date
          @args[:release_date]
        end

        def listeners_count
          track_record.listeners_count
        end

        def plays_count
          @args[:plays_count]
        end

        def profiles_count
          track_record.profiles_count
        end

        def creation_date
          @args[:creation_date]
        end

        def query_title
          @args[:query_title]
        end

        def query_artist_name
          @args[:query_artist_name]
        end
      end
    end
  end
end
