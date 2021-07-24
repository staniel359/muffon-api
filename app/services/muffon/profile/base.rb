module Muffon
  module Profile
    class Base < Muffon::Base
      PARAMS = %i[
        email
        password
        password_confirmation
        nickname
        avatar
        gender
        birthdate
        country
        city
      ].freeze
      ATTRS = %i[
        id
        email
        nickname
        avatar_url
        gender
        birthdate
        country
        city
      ].freeze

      private

      def primary_args
        [@args.profile_id]
      end

      def no_data?
        profile.blank?
      end

      def profile
        @profile ||= ::Profile.find(
          @args.profile_id
        )
      end

      def profile_params
        PARAMS.reject do |p|
          %i[avatar].include?(p)
        end
      end

      def errors?
        profile.errors.any?
      end

      def errors_data
        forbidden.merge(
          { errors: errors }
        )
      end

      def errors
        profile.errors.map do |e|
          { e.attribute => e.type }
        end
      end

      def process_avatar
        return if @args.avatar.blank?

        remove_avatar

        add_avatar if @args.avatar != 'DELETED'
      end

      def remove_avatar
        profile.avatar.purge
      end

      def add_avatar
        profile.avatar.attach(
          avatar_blob
        )
      end

      def avatar_blob
        Muffon::Profile::Avatar.call(
          avatar: @args.avatar
        )
      end

      def profile_data
        profile.slice(*ATTRS)
      end
    end
  end
end
