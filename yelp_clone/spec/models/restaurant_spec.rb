require 'rails_helper'

describe Restaurant, type: :model do

  subject(:restaurant) {described_class.new}

  it "should be dependent on a restaurant" do
    expect(restaurant).to have_many(:reviews).dependent(:destroy)
  end

  it "is not valid with a name of less than three characters" do
    restaurant = Restaurant.new(name: 'x')
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end
end
