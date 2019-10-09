require 'rails_helper'

RSpec.describe University, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "is valid with valid attributes" do
    expect(University.new(name: "NCSU")).to be_valid
  end

  it "is valid with valid attributes" do
    expect(University.new(name: "")).to_not be_valid
  end

end
