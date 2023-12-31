RSpec.describe Deezer::Utils::Audio::Decrypter::Link do
  subject { described_class }

  describe 'successful processing' do
    context 'when track_id present' do
      let(:output) do
        VCR.use_cassette 'services/deezer/utils/audio/decrypter/link/success' do
          subject.call(track_id: '69000435')
        end
      end

      it { expect(output).to eq(Helpers::Deezer::Utils.audio_decrypter_link) }
    end
  end

  describe 'no processing' do
    context 'when no track_id' do
      let(:output) { subject.call }

      it { expect(output).to be_nil }
    end

    context 'when wrong track_id' do
      let(:output) do
        VCR.use_cassette 'services/deezer/utils/audio/decrypter/link/wrong_id' do
          subject.call(track_id: random)
        end
      end

      it { expect(output).to be_nil }
    end
  end
end
