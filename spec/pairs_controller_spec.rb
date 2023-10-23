require 'rails_helper'

RSpec.describe PairsController, type: :controller do
  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
    
    it "assigns @pairs" do
      pairs = create_list(:pair, 3)
      get :index
      expect(assigns(:pairs)).to eq(pairs)
    end
    
    it "renders JSON with expected attributes" do
      create(:student, id: 1, fullname: "John Doe")
      create(:student, id: 2, fullname: "Jane Doe")
      pair = create(:pair, student1_id: 1, student2_id: 2)
      get :index, format: :json
      expect(JSON.parse(response.body)).to eq(
        [{
          "id" => pair.id,
          "student1_name" => "John Doe",
          "student2_name" => "Jane Doe",
          "week_no" => pair.week_no,
          "created_at" => pair.created_at.as_json
        }]
      )
    end
  end
  
  describe "POST #create" do
    context "with valid params" do
      it "creates a new Pair" do
        expect {
          post :create, params: { pair: attributes_for(:pair) }
        }.to change(Pair, :count).by(1)
      end
      
      it "returns a 204 No Content status" do
        post :create, params: { pair: attributes_for(:pair) }
        expect(response).to have_http_status(:no_content)
      end
    end
    
    context "with invalid params" do
      it "returns an error message" do
        post :create, params: { pair: attributes_for(:pair, week_no: nil) }
        expect(JSON.parse(response.body)).to eq({
          "errors" => ["Week no can't be blank"]
        })
      end
      
      it "returns a 422 Unprocessable Entity status" do
        post :create, params: { pair: attributes_for(:pair, week_no: nil) }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
  
  describe "DELETE #destroy" do
    it "destroys the requested pair" do
      pair = create(:pair)
      expect {
        delete :destroy, params: { id: pair.to_param }
      }.to change(Pair, :count).by(-1)
    end
    
    it "returns a success message" do
      pair = create(:pair)
      delete :destroy, params: { id: pair.to_param }
      expect(JSON.parse(response.body)).to eq({
        "message" => "Pair was successfully deleted."
      })
    end
    
    it "returns a 422 Unprocessable Entity status if destroy fails" do
      pair = create(:pair)
      allow_any_instance_of(Pair).to receive(:destroy).and_return(false)
      delete :destroy, params: { id: pair.to_param }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
