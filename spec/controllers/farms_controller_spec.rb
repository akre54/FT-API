require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe FarmsController do

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FarmsController. Be sure to keep this updated too.
  def valid_session
    { auth: "yes", id: 2 }
  end

  let(:farm) { FactoryGirl.create(:farm) }

  describe "GET index" do
    it "assigns all farms as @farms" do
      get :index, {}, valid_session
      assigns(:farms).should eq([farm])
    end
  end

  describe "GET show" do
    it "assigns the requested farm as @farm" do
      get :show, {:id => farm.to_param}, valid_session
      assigns(:farm).should eq(farm)
    end
  end

  describe "GET edit" do
    it "assigns the requested farm as @farm" do
      get :edit, {:id => farm.to_param}, valid_session
      assigns(:farm).should eq(farm)
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested farm" do
        farm = Farm.create! valid_attributes
        # Assuming there are no other farms in the database, this
        # specifies that the Farm created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Farm.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => farm.to_param, :farm => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested farm as @farm" do
        farm = Farm.create! valid_attributes
        put :update, {:id => farm.to_param, :farm => valid_attributes}, valid_session
        assigns(:farm).should eq(farm)
      end

      it "redirects to the farm" do
        farm = Farm.create! valid_attributes
        put :update, {:id => farm.to_param, :farm => valid_attributes}, valid_session
        response.should redirect_to(farm)
      end
    end

    describe "with invalid params" do
      it "assigns the farm as @farm" do
        farm = Farm.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Farm.any_instance.stub(:save).and_return(false)
        put :update, {:id => farm.to_param, :farm => {}}, valid_session
        assigns(:farm).should eq(farm)
      end

      it "re-renders the 'edit' template" do
        farm = Farm.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Farm.any_instance.stub(:save).and_return(false)
        put :update, {:id => farm.to_param, :farm => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested farm" do
      farm = Farm.create! valid_attributes
      expect {
        delete :destroy, {:id => farm.to_param}, valid_session
      }.to change(Farm, :count).by(-1)
    end

    it "redirects to the farms list" do
      farm = Farm.create! valid_attributes
      delete :destroy, {:id => farm.to_param}, valid_session
      response.should redirect_to(farms_url)
    end
  end

end
