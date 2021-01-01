RSpec.describe Product, type: :model do
  describe 'Factory' do
    it 'is expected to have valid factory bot' do
      expect(create(:product)).to be_valid
    end
  end

  describe 'Database table' do
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :description }
    it { is_expected.to have_db_column :price }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price) }
  end

  describe 'Associations' do
    it { is_expected.to have_many :order_items }
  end
end
