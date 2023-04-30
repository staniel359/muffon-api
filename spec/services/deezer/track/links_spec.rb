RSpec.describe Deezer::Track::Links do
  subject { described_class }

  describe 'successful processing' do
    context 'when track_id present' do
      let(:output) do
        VCR.use_cassette 'services/deezer/track/links/success' do
          subject.call(track_id: '11616579')
        end
      end

      it { expect(output).to eq(Helpers::Deezer::Track.links_data) }
    end
  end

  describe 'no processing' do
    context 'when no track_id' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong track_id' do
      let(:output) do
        VCR.use_cassette 'services/deezer/track/links/wrong_id' do
          subject.call(track_id: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
