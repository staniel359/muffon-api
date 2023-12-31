RSpec.describe Deezer::Utils::Audio::Decrypter::Key do
  subject { described_class }

  describe 'successful processing' do
    context 'when track_id present' do
      let(:output) do
        subject.call(track_id: '69000435')
      end

      it { expect(output).to eq(Helpers::Deezer::Utils.audio_decrypter_key) }
    end
  end

  describe 'no processing' do
    context 'when no track_id' do
      let(:output) { subject.call }

      it { expect(output).to be_nil }
    end
  end
end
