RSpec.describe MusixMatch::Album::Links do
  subject { described_class }

  describe 'successful processing' do
    context 'when album_id present' do
      let(:output) do
        VCR.use_cassette 'services/musixmatch/album/links/success' do
          subject.call(album_id: '14232026', profile_id: 1)
        end
      end

      it { expect(output).to eq(Helpers::MusixMatch::Album.links_data) }
    end
  end

  describe 'no processing' do
    context 'when no album_id given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong album_id' do
      let(:output) do
        VCR.use_cassette 'services/musixmatch/album/links/wrong_id' do
          subject.call(album_id: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
