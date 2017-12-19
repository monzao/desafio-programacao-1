require 'rails_helper'

RSpec.describe Purchaser, type: :model do
  subject { build(:purchaser) }

  context 'Relationships' do
    it { is_expected.to have_many :purchases }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of(:name).ignoring_case_sensitivity }
  end
end
