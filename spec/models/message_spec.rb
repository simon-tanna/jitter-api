require 'rails_helper'

RSpec.describe Message, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before(:all) do
    @test_user = FactoryBot.create(:user, username: "TestUser", email: "test@example.com", password: "123456", password_confirmation: "123456")
  end

  subject {
    described_class.new(
      text: "This is a test message",
      user: @test_user
  )
  }

  it "is valid with a text attribute" do
    expect(subject).to be_valid
  end

  it "is not valide with an empty text attribute" do
    subject.text = ""
    expect(subject).not_to be_valid
  end

end
