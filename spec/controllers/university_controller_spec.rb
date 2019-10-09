require 'rails_helper'

RSpec.describe UniversitiesController, type: :controller do
  describe "GET index" do
    it "assigns" do
      @univ = University.new(name: "xxxx")
      @univ.save
      get :index
      expect(assigns(:universities)).to eq([@univ])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "update" do
      @univ = University.new(name: "xxxx")
      @univ.save
      @univ.update(name: "uu")

      get :index
      expect(assigns(:universities)).to eq([@univ])
    end

    it "create" do
      @univ = University.create(name: "name")
      @univ.save

      get :index
      expect(assigns(:universities)).to eq([@univ])
    end

    it "destroy" do
      @univ = University.create(name: "name")
      @univ.save
      @univ.destroy
      get :index
      expect(assigns(:universities)).to eq([])
    end

    it "destroy first" do
      @univ = University.create(name: "name")
      @univ.save
      @univv = University.create(name: "hhh")
      @univv.save
      @univ.destroy
      get :index
      expect(assigns(:universities)).to eq([@univv])
    end

  end

end
