RSpec.describe OrderItem, type: :model do
  describe 'Factory' do
    it 'is expected to have valid factory bot' do
      expect(create(:order_item)).to be_valid
    end
  end

  describe 'Database table' do
    it { is_expected.to have_db_column :order_id }
    it { is_expected.to have_db_column :product_id }
  end

  describe 'Associations' do
    it { is_expected.to belong_to :order }
    it { is_expected.to belong_to :product }
  end
end
