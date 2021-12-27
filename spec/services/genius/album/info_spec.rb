RSpec.describe Genius::Album::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when id present' do
      let(:output) do
        VCR.use_cassette 'services/genius/album/info/success' do
          subject.call(album_id: '168168', profile_id: 1)
        end
      end

      it { expect(output).to eq(Helpers::Genius::Album.info_data) }
    end
  end

  describe 'no processing' do
    context 'when no id given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong id' do
      let(:output) do
        VCR.use_cassette 'services/genius/album/info/wrong_id' do
          subject.call(album_id: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
