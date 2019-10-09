require 'rails_helper'

RSpec.describe University, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "is valid with valid attributes" do
    expect(University.new).to be_valid
  end

end
