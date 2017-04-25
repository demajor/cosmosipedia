require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do

  let(:user) { create(:user) }

  describe "attributes" do

    it "should have an email attribute" do
      expect(user).to have_attributes(email: "user34@factory.com")
    end

    it "responds to role" do
      expect(user).to respond_to(:role)
    end

    it "responds to admin?" do
      expect(user).to respond_to(:admin?)
    end

    it "responds to standard?" do
      expect(user).to respond_to(:standard?)
    end

    it "responds to premium?" do
      expect(user).to respond_to(:premium?)
    end
  end

  describe "roles" do

    it "is standard by default" do
      expect(user.role).to eql("standard")
    end

    context "standard user" do

      it "returns true for #standard?" do
        expect(user.standard?).to be_truthy
      end

      it "returns false for #admin?" do
        expect(user.admin?).to be_falsey
      end

      it "returns false for #premium?" do
        expect(user.premium?).to be_falsey
      end
    end
  end
end