RSpec.describe VK::Album::Links do
  subject { described_class }

  describe 'successful processing' do
    context 'when album_id given' do
      let(:output) do
        VCR.use_cassette 'services/vk/album/links/success' do
          subject.call(album_id: '3885619', owner_id: '-2000885619', access_key: '154554fc908e1e4c72')
        end
      end

      it { expect(output).to eq(Helpers::VK::Album.links_data) }
    end
  end

  describe 'no processing' do
    context 'when no album_id given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong album_id' do
      let(:output) do
        VCR.use_cassette 'services/vk/album/links/wrong_id' do
          subject.call(
            album_id: random, owner_id: '-2000916168',
            access_key: '43c15929fe11506130'
          )
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
