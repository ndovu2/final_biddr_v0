require 'rails_helper'

RSpec.describe AuctionsController, type: :controller do
  let(:auction_1) { create(:auction) }
  let(:auction_2) { create(:auction) }
  let(:user)     { create(:user) }

  describe "#index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "assigns an instance variable for all auctions" do
      auction_1
      auction_2
      get :index
      expect(assigns(:auctions)).to eq [auction_1, auction_2]
    end
  end

  describe "#new" do
    context "user signed in" do
      before { login(user) }

      it "renders the new template" do
        get :new
        expect(response).to render_template(:new)
      end

    end

    context "user not signed in" do
      it "redirects to sign in page" do
        get :new
        expect(response).to redirect_to new_session_path
      end
    end
  end
end
