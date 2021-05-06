require 'rails_helper'

RSpec.describe Bandcamp::Album::Tags do
  subject { described_class }

  describe 'successful processing' do
    context 'when album present' do
      let(:output) do
        VCR.use_cassette 'bandcamp/album/tags/success' do
          subject.call(artist_id: '2707934946', album_id: '2530224521')
        end
      end

      it { expect(output).to eq(Helpers::Bandcamp::Album.tags_data) }
    end
  end

  describe 'no processing' do
    context 'when no args' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong album' do
      let(:output) do
        VCR.use_cassette 'bandcamp/album/tags/wrong_album' do
          subject.call(artist_id: '2707934946', album_id: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
