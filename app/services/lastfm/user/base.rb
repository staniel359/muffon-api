module LastFM
  module User
    class Base < LastFM::Base
      include Muffon::Mixins::Profile

      def call
        check_args

        check_if_not_found

        check_if_forbidden

        data
      rescue Faraday::ResourceNotFound
        raise not_found_error
      end

      private

      def required_args
        if skip_profile?
          %i[
            nickname
          ]
        else
          %i[
            profile_id
            token
          ]
        end
      end

      def skip_profile?
        return true if test?

        !!@args[:skip_profile]
      end

      def not_found?
        if skip_profile?
          false
        else
          profile_record.blank?
        end
      end

      def forbidden?
        if skip_profile?
          false
        else
          !valid_profile?
        end
      end

      def request_params
        {
          **super,
          user: lastfm_nickname
        }
      end

      def lastfm_nickname
        @args[:nickname] ||
          lastfm_connection_record&.nickname
      end

      def lastfm_connection_record
        if defined?(@lastfm_connection_record)
          @lastfm_connection_record
        else
          @lastfm_connection_record =
            profile_record.lastfm_connection
        end
      end

      def data
        { user: user_data }
      end
    end
  end
end
