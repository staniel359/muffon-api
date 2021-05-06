require 'rails_helper'

RSpec.describe Yandex::Music::Utils::SessionId do
  subject { described_class }

  let(:secrets) { Rails.application.credentials }

  describe 'successful processing' do
    context 'when no args' do
      let(:output) do
        VCR.use_cassette 'yandex/music/utils/session_id/success' do
          subject.call
        end
      end

      it { expect(output).to eq(secrets.yandex[:test_session_id]) }
    end
  end
end
