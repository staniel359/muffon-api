require 'rails_helper'

RSpec.describe YandexMusic::Utils::SessionId do
  subject { described_class }

  describe 'successful processing' do
    context 'when no args' do
      let(:output) do
        VCR.use_cassette 'yandexmusic/utils/session_id/success' do
          subject.call
        end
      end

      it { expect(output).to be_present }
    end
  end
end
