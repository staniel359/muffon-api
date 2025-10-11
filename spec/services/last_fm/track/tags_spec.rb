RSpec.describe LastFM::Track::Tags do
  subject { described_class }

  describe 'successful processing' do
    context 'when track exists' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/track/tags/success'
        ) do
          subject.call(
            artist_name: 'wild nothing',
            track_title: 'chinatown'
          )
        end
      end

      it { expect(output).to eq(lastfm_track_tags_data) }
    end
  end

  describe 'no processing' do
    context 'when no artist name given' do
      let(:output) do
        subject.call(
          track_title: 'chinatown'
        )
      end

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when no title given' do
      let(:output) do
        subject.call(
          artist_name: 'wild nothing'
        )
      end

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong artist' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/track/tags/wrong_artist'
        ) do
          subject.call(
            artist_name: random_string,
            track_title: 'chinatown'
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end

    context 'when wrong title' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/track/tags/wrong_title'
        ) do
          subject.call(
            artist_name: 'wild nothing',
            track_title: random_string
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
