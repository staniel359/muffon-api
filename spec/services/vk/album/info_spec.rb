require 'rails_helper'

RSpec.describe VK::Album::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when album_id given' do
      let(:output) do
        VCR.use_cassette 'vk/album/info/success' do
          subject.call(
            album_id: '1916168', owner_id: '-2000916168',
            access_hash: '43c15929fe11506130'
          )
        end
      end

      it { expect(output).to eq(Helpers::VK::Album.info_data) }
    end
  end

  describe 'no processing' do
    context 'when no album_id given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong album_id' do
      let(:output) do
        VCR.use_cassette 'vk/album/info/wrong_id' do
          subject.call(album_id: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
