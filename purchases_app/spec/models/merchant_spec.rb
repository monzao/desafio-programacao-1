require 'rails_helper'

RSpec.describe Merchant, type: :model do
  subject { build(:merchant) }

  context 'Relationships' do
    it { is_expected.to have_many :items }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :address }
    it { is_expected.to validate_uniqueness_of(:name).ignoring_case_sensitivity }
  end
end
