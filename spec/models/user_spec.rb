require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  subject { described_class.new(
    username: "Anything",
    email: "a@b.com",
    password: "2020587992566595"
  )}

  describe 'Validations' do
    # validation tests/examples here

    it "is valid with valid attributes" do
      expect(subject).to be_valid
      expect(subject.errors).to be_empty
    end

    it "is not valid without a username" do
      subject.username = nil
      expect(subject).to_not be_valid
      expect(subject.errors).to_not be_empty
    end 

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
      expect(subject.errors).to_not be_empty
    end 

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
      expect(subject.errors).to_not be_empty
    end 

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    
    it "should authenticate with credentials" do
      user = User.authenticate_with_credentials(subject.email, subject.password)
      expect(user).to eq(User.find_by(email: subject.email))
    end 

    it "should authenticate with credentials" do
      user = User.authenticate_with_credentials(subject.email, '2020587942566595')
      expect(user).to be nil
    end 

  end

end
