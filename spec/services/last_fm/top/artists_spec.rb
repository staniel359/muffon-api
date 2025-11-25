RSpec.describe LastFM::Top::Artists do
  subject { described_class }

  describe 'successful processing' do
    context 'when no primary args' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/top/artists/success'
        ) do
          subject.call(
            page: '2',
            limit: '5',
            profile_id: '1'
          )
        end
      end

      it { expect(output).to eq(lastfm_top_artists_data) }
    end

    context 'when country present' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/top/artists/success_country'
        ) do
          subject.call(
            country: 'US'
          )
        end
      end

      it { expect(output).to eq(lastfm_top_artists_country_data) }
    end
  end

  describe 'no processing' do
    context 'when wrong country' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/top/artists/wrong_country'
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
