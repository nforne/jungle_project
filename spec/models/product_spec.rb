require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'Validations' do
    # validation tests/examples here

    let(:category) {
      Category.new(:id => 1, :name => "Hardware")
    }

    subject { described_class.new(
      name: "Anything",
      category_id: category.id,
      quantity: 2,
      price_cents: 200,
    ) }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
      expect(subject.errors).to be_empty
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors).to_not be_empty
    end 

    it "is not valid without a price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
      expect(subject.errors).to_not be_empty
    end 

    it "is not valid without a quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
      expect(subject.errors).to_not be_empty
    end 

    it "is not valid without a category" do
      subject.category = nil
      expect(subject).to_not be_valid
      expect(subject.errors).to_not be_empty
    end  


  end

end
