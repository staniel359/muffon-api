RSpec.describe Deezer::Utils::Token::Track do
  subject { described_class }

  describe 'successful processing' do
    context 'when track_id present' do
      let(:output) do
        VCR.use_cassette 'services/deezer/utils/token/track/success' do
          subject.call(track_id: '11616579')
        end
      end

      it { expect(output).to eq(Helpers::Deezer::Utils.track_token_data) }
    end
  end

  describe 'no processing' do
    context 'when no track_id' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Deezer::Utils.track_token_no_data) }
    end

    context 'when wrong track_id' do
      let(:output) do
        VCR.use_cassette 'services/deezer/utils/token/track/wrong_id' do
          subject.call(track_id: random)
        end
      end

      it { expect(output).to eq(Helpers::Deezer::Utils.track_token_no_data) }
    end
  end
end
