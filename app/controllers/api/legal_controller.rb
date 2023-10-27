module API
  class LegalController < API::BaseController
    def privacy_policy; end

    def terms_and_conditions; end

    private

    def allowed_request?
      true
    end

    def privacy_policy_data
      {
        legal: legal_data(
          'privacy_policy'
        )
      }
    end

    def legal_data(scope)
      { scope => legal_file(scope) }
    end

    def legal_file(scope)
      File.read(
        "public/legal/#{scope}.txt"
      )
    end

    def terms_and_conditions_data
      {
        legal: legal_data(
          'terms_and_conditions'
        )
      }
    end
  end
end
