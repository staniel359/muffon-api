require 'rails_helper'

RSpec.describe Deezer::Utils::Audio::Decoder do
  subject { described_class }

  describe 'successful processing' do
    context 'when track_id given' do
      let(:output) do
        VCR.use_cassette 'deezer/utils/audio/decoder/success' do
          subject.call(track_id: '11221319')
        end
      end

      it { expect(output).to eq(Helpers::Deezer::Utils::Audio.decoder_data) }
    end
  end

  describe 'unsuccessful processing' do
    context 'when no track_id given' do
      let(:output) { subject.call }

      it { expect(output).to eq('') }
    end
  end
end
