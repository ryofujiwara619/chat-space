require 'rails_helper'

describe MessagesController, type: :controller do
  # 定義
  let(:group){ create(:group) }
  let(:user){ create(:user) }

  # indexのテスト
  describe "GET #index" do

    # ユーザーがログインしている時
    context "when user sign_in" do

      before do
        login_user user
      end

      before :each do
        get :index, params: { group_id: group }
      end

      # @groupsの確認
      it "assigns the requested groups to @groups" do
        groups = create_list(:group, 5, user_ids: user.id)
        expect(assigns(:groups)).to eq groups
      end

      # @groupの確認
      it "assigns the requested group to @group" do
        expect(assigns(:group)).to eq group
      end

      # @messageの確認
      it "assigns a new message to @message" do
        expect(assigns(:message)).to be_a_new(Message)
      end

      # indexのビューを表示
      it "renders the :index template" do
        expect(response).to render_template :index
      end
    end

    # ユーザーがログインしていない場合
    context "not user sign_in" do
      it "redirect_to sign_in" do
        get :index, group_id: group
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  # createのテスト
  describe "POST #create" do

      # ユーザーログイン時
      context "when user sign_in" do

      before do
      login_user user
      end

      # 保存が成功時
      context "save success" do

        # 保存されたことの確認
        it "save a new message to DB" do
          expect{ post :create, group_id: group.id, user_id: user.id, message:attributes_for(:message) }.to change(Message, :count).by(1)
        end

        # リダイレクトの確認
        it "redirect_to index" do
          post :create, message: attributes_for(:message), group_id: group.id, user_id: user.id
          expect(response).to redirect_to group_messages_path(group.id)
        end
      end

      # 保存が失敗時
      context "not save success" do

        # 保存されていないことの確認
        it "not save a new message to DB" do
          message_params = attributes_for(:message, body: nil, image: nil)
          expect{ post :create, group_id: group.id, user_id: user.id, message: message_params}.not_to change(Message, :count)
        end

        # フラッシュメッセージを表示
        it "generate error flash message" do
          message_params = attributes_for(:message, body: nil, image: nil)
          post :create, group_id: group.id, user_id: user.id, message: message_params
          expect(flash[:alert]).to include("メッセージ送信に失敗しました")
        end
      end
    end


    # ユーザーがログインしていない時
    context "not user sign_in" do

      # ログインページへ遷移
      it "redirect_to login page" do
        message_params = attributes_for(:message, body: nil, image: nil)
        post :create, group_id: group, user_id: user, message: message_params
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
