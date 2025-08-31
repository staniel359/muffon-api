RSpec.describe AmazonMusic::Artist::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist_id present' do
      let(:output) do
        VCR.use_cassette(
          'services/amazonmusic/artist/info/success'
        ) do
          subject.call(
            artist_id: 'B001E3EXN2'
          )
        end
      end

      it { expect(output).to eq(amazonmusic_artist_info_data) }
    end
  end

  describe 'no processing' do
    context 'when no artist_id given' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong artist_id' do
      let(:output) do
        VCR.use_cassette(
          'services/amazonmusic/artist/info/wrong_id'
        ) do
          subject.call(
            artist_id: random_string,
            album_type: 'album'
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
