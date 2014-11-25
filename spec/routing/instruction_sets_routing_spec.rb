require "rails_helper"

RSpec.describe InstructionSetsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/instruction_sets").to route_to("instruction_sets#index")
    end

    it "routes to #new" do
      expect(:get => "/instruction_sets/new").to route_to("instruction_sets#new")
    end

    it "routes to #show" do
      expect(:get => "/instruction_sets/1").to route_to("instruction_sets#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/instruction_sets/1/edit").to route_to("instruction_sets#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/instruction_sets").to route_to("instruction_sets#create")
    end

    it "routes to #update" do
      expect(:put => "/instruction_sets/1").to route_to("instruction_sets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/instruction_sets/1").to route_to("instruction_sets#destroy", :id => "1")
    end

  end
end
