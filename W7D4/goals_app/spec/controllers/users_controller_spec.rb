require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    describe "GET #new" do
        it "renders new user template" do
            get :new
            expect(response).to render_template(:new)
        end
    end

    describe "POST #create" do
        let(:user_params) do
            {
                user:{
                    username: "Jared", 
                    password: "123456"
                }
            }
        end
        context "with valid params" do
            it "saves the user and logs in the user" do
                post :create, params: user_params
                user = User.find_by(username: "Jared")
                expect(session[:session_token]).to eq(user.session_token)
            end
            it "redirects to the user's show page" do
                post :create, params: user_params
                user = User.find_by(username: "Jared")
                expect(response).to redirect_to(user_url(user))
            end
        end
        context "with invalid params" do
            it "should validate the user params and render the new template with errors" do
                post :create, params: {user:{password:"12345"}}
                expect(response).to render_template(:new)
                expect(flash[:errors]).to be_present
            end
        end
    end

end
