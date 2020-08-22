require 'rails_helper'

describe BuyersController, type: :controller do
  let(:create_user) { create(:create_user) }
  let(:card) { create(:card, create_user_id: create_user.id) }
  describe 'GET #show' do
    contex 'ログイン時' do
      before do
        login create_user
      end

      it "showアクションにページが遷移するか" do
        allow(Payjp::Customer).to receive(:create).add_return(PayjpMock.prepare_customer_information)
        product = create(:product)
        get :show, params: { id: product,card: card}
        expect(response).to render_template :show
      end
    end
  end
end