require 'rails_helper'

RSpec.describe Purchase, type: :model do
  subject { build(:purchase) }

  context 'Relationships' do
    it { is_expected.to belong_to :purchaser }
    it { is_expected.to belong_to :item }
  end
end
