require 'rails_helper'

RSpec.describe VK::Utils::Audio do
  subject { described_class }

  describe 'successful processing' do
    context 'when ids given' do
      let(:output) do
        VCR.use_cassette 'vk/utils/audio/success' do
          subject.call(
            ids: ['-2001904794_58904794_c2b4a23a2956b2ddeb_778e0f8167534138da']
          )
        end
      end

      it { expect(output).to eq(Helpers::VK.audio_data) }
    end
  end

  describe 'no processing' do
    context 'when no id given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::VK.bad_request_error) }
    end

    context 'when wrong id' do
      let(:output) do
        VCR.use_cassette 'vk/utils/audio/wrong_ids' do
          subject.call(
            ids: ['58823619_2001823619_2349e4512b9e6f97e2_ebe92dd9055e91e340']
          )
        end
      end

      it { expect(output).to eq(Helpers::VK.not_found_error) }
    end
  end
end
