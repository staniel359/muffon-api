RSpec.describe YouTubeMusic::Track::Links do
  subject { described_class }

  describe 'successful processing' do
    context 'when track_id present' do
      let(:output) do
        VCR.use_cassette(
          'services/youtubemusic/track/links/success'
        ) do
          subject.call(
            track_id: '1aTIkQf3eRY'
          )
        end
      end

      it { expect(output).to eq(youtube_music_track_links_data) }
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
          'services/youtubemusic/track/links/wrong_id'
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
