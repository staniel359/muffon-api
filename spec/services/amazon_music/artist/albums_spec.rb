RSpec.describe AmazonMusic::Artist::Albums do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist_id present' do
      let(:output) do
        VCR.use_cassette 'services/amazonmusic/artist/albums/success' do
          subject.call(artist_id: 'B001E3EXN2', page: Helpers::AmazonMusic::Artist.albums_next_page, profile_id: 1)
        end
      end

      it { expect(output).to eq(Helpers::AmazonMusic::Artist.albums_data) }
    end
  end

  describe 'no processing' do
    context 'when no artist_id given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong artist_id' do
      let(:output) do
        VCR.use_cassette 'services/amazonmusic/artist/albums/wrong_id' do
          subject.call(artist_id: random, album_type: 'album')
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
