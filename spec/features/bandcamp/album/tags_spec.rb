require 'rails_helper'

RSpec.describe Bandcamp::Album::Tags do
  subject { described_class }

  describe 'successful processing' do
    context 'when album_link present' do
      let(:output) do
        VCR.use_cassette 'bandcamp/album/tags/success' do
          subject.call(
            album_link: 'luxuryelite.bandcamp.com/album/high-society'
          )
        end
      end

      it { expect(output).to eq(Helpers::Bandcamp::Album.tags_data) }
    end
  end

  describe 'no processing' do
    context 'when no album_link given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong link' do
      let(:output) do
        VCR.use_cassette 'bandcamp/album/tags/wrong_link' do
          subject.call(album_link: Helpers::Base::RANDOM_STRING)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
