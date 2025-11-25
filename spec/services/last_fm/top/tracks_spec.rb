RSpec.describe LastFM::Top::Tracks do
  subject { described_class }

  describe 'successful processing' do
    context 'when no primary args' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/top/tracks/success'
        ) do
          subject.call(
            page: '2',
            limit: '5',
            profile_id: '1'
          )
        end
      end

      it { expect(output).to eq(lastfm_top_tracks_data) }
    end

    context 'when country present' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/top/tracks/success_country'
        ) do
          subject.call(
            country: 'US',
            page: '2',
            limit: '5'
          )
        end
      end

      it { expect(output).to eq(lastfm_top_tracks_country_data) }
    end
  end

  describe 'no processing' do
    context 'when wrong country' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/top/tracks/wrong_country'
        ) do
          subject.call(
            country: random_string
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
