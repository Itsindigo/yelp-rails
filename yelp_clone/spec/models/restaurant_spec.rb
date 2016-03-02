require 'rails_helper'

describe Restaurant, type: :model do

  subject(:restaurant) {described_class.new}

  it "should be dependent on a restaurant" do
    expect(restaurant).to have_many(:reviews).dependent(:destroy)
  end

  it "should belong to a user" do
    expect(restaurant).to belong_to(:user)
  end

  it "is not valid with a name of less than three characters" do
    restaurant = Restaurant.new(name: 'x')
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it "is not validated unless it has a unique name" do
    Restaurant.create(name: "Moe's tavern")
    moes = Restaurant.new(name: "Moe's tavern")
    expect(moes).to have(1).error_on(:name)
  end
end
