require 'rails_helper'

RSpec.describe UniversitiesController, type: :controller do
  describe "POST universities#create" do
    it "should create a new university" do
      admin =
      visit universities_url
      fill_in "Name", with: "NCSU"
      expect { click_button "Create University" }.to change(University, :count).by(1)
    end
  end


end
