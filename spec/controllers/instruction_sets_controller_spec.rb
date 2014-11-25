require 'rails_helper'


RSpec.describe InstructionSetsController, :type => :controller do

  let(:test_instructions) {
    FactoryGirl.create(:instruction_set)
  }

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:instruction_set)
  }

  let(:invalid_attributes) {{ name: '', description: '' }}

  
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all instruction_sets as @instruction_sets" do
      get :index
      expect(assigns(:instruction_sets)).to match_array([test_instructions])
    end
  end

  describe "GET show" do
    it "assigns the requested instruction_set as @instruction_set" do
      get :show, {:id => test_instructions.to_param}
      expect(assigns(:instruction_set)).to eq(test_instructions)
    end
  end

  describe "GET new" do
    it "assigns a new instruction_set as @instruction_set" do
      get :new
      expect(assigns(:instruction_set)).to be_a_new(InstructionSet)
    end
  end

  describe "GET edit" do
    it "assigns the requested instruction_set as @instruction_set" do
      get :edit, {id: test_instructions.id}
      expect(assigns(:instruction_set)).to eq(test_instructions)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new InstructionSet" do
        expect {
          post :create, {:instruction_set => valid_attributes}
        }.to change(InstructionSet, :count).by(1)
      end

      it "assigns a newly created instruction_set as @instruction_set" do
        post :create, {:instruction_set => valid_attributes}
        expect(assigns(:instruction_set)).to be_a(InstructionSet)
        expect(assigns(:instruction_set)).to be_persisted
      end

      it "redirects to the created instruction_set" do
        post :create, {:instruction_set => valid_attributes}
        expect(response).to redirect_to(InstructionSet.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved instruction_set as @instruction_set" do
        post :create, {:instruction_set => invalid_attributes}
        expect(assigns(:instruction_set)).to be_a_new(InstructionSet)
      end

      it "re-renders the 'new' template" do
        post :create, {:instruction_set => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        ( {name: 'new name', description: 'new description'} )
      }

      it "updates the requested instruction_set" do
        instruction_set = InstructionSet.create! valid_attributes
        put :update, {:id => instruction_set.to_param, :instruction_set => new_attributes}
        instruction_set.reload
        expect(assigns(:instruction_set).name).to eq('new name')
      end

      it "assigns the requested instruction_set as @instruction_set" do
        instruction_set = InstructionSet.create! valid_attributes
        put :update, {:id => instruction_set.to_param, :instruction_set => valid_attributes}
        expect(assigns(:instruction_set)).to eq(instruction_set)
      end

      it "redirects to the instruction_set" do
        instruction_set = InstructionSet.create! valid_attributes
        put :update, {:id => instruction_set.to_param, :instruction_set => valid_attributes}
        expect(response).to redirect_to(instruction_set)
      end
    end

    describe "with invalid params" do
      it "assigns the instruction_set as @instruction_set" do
        instruction_set = InstructionSet.create! valid_attributes
        put :update, {:id => instruction_set.to_param, :instruction_set => invalid_attributes}
        expect(assigns(:instruction_set)).to eq(instruction_set)
      end

      it "re-renders the 'edit' template" do
        instruction_set = InstructionSet.create! valid_attributes
        put :update, {:id => instruction_set.to_param, :instruction_set => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested instruction_set" do
      instruction_set = InstructionSet.create! valid_attributes
      expect {
        delete :destroy, {:id => instruction_set.to_param}
      }.to change(InstructionSet, :count).by(-1)
    end

    it "redirects to the instruction_sets list" do
      instruction_set = InstructionSet.create! valid_attributes
      delete :destroy, {:id => instruction_set.to_param}
      expect(response).to redirect_to(instruction_sets_url)
    end
  end

end
