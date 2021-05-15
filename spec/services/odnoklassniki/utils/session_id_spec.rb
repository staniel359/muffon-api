require 'rails_helper'

RSpec.describe Odnoklassniki::Utils::SessionId do
  subject { described_class }

  describe 'successful processing' do
    context 'when no args given' do
      let(:output) do
        VCR.use_cassette 'odnoklassniki/utils/session_id/success' do
          subject.call
        end
      end

      it do
        expect(output).to eq(
          Helpers::Odnoklassniki::Utils.session_id
        )
      end
    end
  end
end
