require 'rails_helper'

RSpec.describe Bandcamp::ID do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist link' do
      let(:output) do
        VCR.use_cassette 'bandcamp/id/artist_link' do
          subject.call(link: 'https://wildnothingct.bandcamp.com')
        end
      end

      it { expect(output).to eq(Helpers::Bandcamp::ID.artist_data) }
    end

    context 'when album link' do
      let(:output) do
        VCR.use_cassette 'bandcamp/id/album_link' do
          subject.call(link: 'https://wildnothingct.bandcamp.com/album/gemini')
        end
      end

      it { expect(output).to eq(Helpers::Bandcamp::ID.album_data) }
    end

    context 'when track link' do
      let(:output) do
        VCR.use_cassette 'bandcamp/id/track_link' do
          subject.call(link: 'https://wildnothingct.bandcamp.com/track/gemini')
        end
      end

      it { expect(output).to eq(Helpers::Bandcamp::ID.track_data) }
    end

    context 'when label link' do
      let(:output) do
        VCR.use_cassette 'bandcamp/id/label_link' do
          subject.call(link: 'https://capturedtracks.bandcamp.com')
        end
      end

      it { expect(output).to eq(Helpers::Bandcamp::ID.label_data) }
    end
  end

  describe 'no processing' do
    context 'when no link' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong link' do
      let(:output) do
        VCR.use_cassette 'bandcamp/id/wrong_link' do
          subject.call(link: Helpers::Base::RANDOM_STRING)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
