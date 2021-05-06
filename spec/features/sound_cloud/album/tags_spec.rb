require 'rails_helper'

RSpec.describe SoundCloud::Album::Tags do
  subject { described_class }

  describe 'successful processing' do
    context 'when album_id present' do
      let(:output) do
        VCR.use_cassette 'soundcloud/album/tags/success' do
          subject.call(album_id: '1092365263')
        end
      end

      it { expect(output).to eq(Helpers::SoundCloud::Album.tags_data) }
    end
  end

  describe 'no processing' do
    context 'when no album_id given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong album_id' do
      let(:output) do
        VCR.use_cassette 'soundcloud/album/tags/wrong_id' do
          subject.call(album_id: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
