require 'rails_helper'

RSpec.describe Item, type: :model do
  subject { build(:item) }

  context 'Relationships' do
    it { is_expected.to belong_to :merchant }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :price }
  end
end
