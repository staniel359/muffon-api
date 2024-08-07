RSpec.describe MusicBrainz::Track::Albums do
  subject { described_class }

  describe 'successful processing' do
    context 'when track_id present' do
      let(:output) do
        VCR.use_cassette 'services/musicbrainz/track/albums/success' do
          subject.call(track_id: '6029d549-5858-4936-9156-b90770d2ae92', profile_id: 1)
        end
      end

      it { expect(output).to eq(Helpers::MusicBrainz::Track.albums_data) }
    end
  end

  describe 'no processing' do
    context 'when no track_id given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong track_id' do
      let(:output) do
        VCR.use_cassette 'services/musicbrainz/track/albums/wrong_id' do
          subject.call(track_id: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
