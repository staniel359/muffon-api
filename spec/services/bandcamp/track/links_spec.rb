RSpec.describe Bandcamp::Track::Links do
  subject { described_class }

  describe 'successful processing' do
    context 'when track present' do
      let(:output) do
        VCR.use_cassette 'services/bandcamp/track/links/success' do
          subject.call(artist_id: '2228040235', track_id: '1709958085')
        end
      end

      it { expect(output).to eq(Helpers::Bandcamp::Track.links_data) }
    end
  end

  describe 'no processing' do
    context 'when no args' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong track' do
      let(:output) do
        VCR.use_cassette 'services/bandcamp/track/links/wrong_track' do
          subject.call(artist_id: '2228040235', track_id: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
