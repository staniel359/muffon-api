RSpec.describe MusicBrainz::Track::Tags do
  subject { described_class }

  describe 'successful processing' do
    context 'when track_id present' do
      let(:output) do
        VCR.use_cassette(
          'services/musicbrainz/track/tags/success'
        ) do
          subject.call(
            track_id: '6029d549-5858-4936-9156-b90770d2ae92'
          )
        end
      end

      it { expect(output).to eq(musicbrainz_track_tags_data) }
    end
  end

  describe 'no processing' do
    context 'when no track_id given' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong track_id' do
      let(:output) do
        VCR.use_cassette(
          'services/musicbrainz/track/tags/wrong_id'
        ) do
          subject.call(
            track_id: random_string
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
