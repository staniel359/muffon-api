RSpec.describe Bandcamp::Track::Albums do
  subject { described_class }

  describe 'successful processing' do
    context 'when track present' do
      let(:output) do
        VCR.use_cassette 'services/bandcamp/track/albums/success' do
          subject.call(artist_id: '2228040235', track_id: '2723372494', profile_id: 1)
        end
      end

      it { expect(output).to eq(Helpers::Bandcamp::Track.albums_data) }
    end
  end

  describe 'no processing' do
    context 'when no args' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong track' do
      let(:output) do
        VCR.use_cassette 'services/bandcamp/track/albums/wrong_track' do
          subject.call(artist_id: '2228040235', track_id: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
