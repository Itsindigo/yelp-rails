require 'rails_helper'

describe User do

  subject(:user) {described_class.new}

  it "should allow many relations with restaurants" do
    expect(user).to have_many(:restaurants)
  end
end
