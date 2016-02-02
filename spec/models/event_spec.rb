require 'rails_helper'

describe Event do
  describe '#created_by?' do
    let(:event) { create(:event) }
    subject { event.created_by?(user) }

    context '引数がnilなとき' do
      let(:user) { nil }
      it { is_expected.to be_falsey }
    end

    context '#owner_idと引数の#idが同じとき' do
      let(:user) { double('user', id: event.id) }
      it { is_expected.to be_truthy }
    end
  end
end
