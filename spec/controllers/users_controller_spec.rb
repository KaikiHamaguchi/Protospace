require 'rails_helper'
RSpec.describe UsersController, type: :controller do
    let(:user) {create(:user)}
    describe 'with user login' do
      login_user
      # インスタンスの値が正しくセットされているかを確かめる
      context 'GET #show' do

        before do
          get :show, id: user
        end

        it 'assigns the requested to @user' do
          expect(assigns(:user)).to eq user
        end
        # showアクションが動いたあとに正しくviewが表示されるか確かめる
        it 'renders the :show template' do
          expect(response).to render_template (:show)
        end
      end

      context 'GET #edit' do
        # editアクションが動いたあとに正しくviewが表示されるか確かめる
        it 'renders the :edit template' do
          get :edit, id: user
          expect(response).to render_template :edit
        end
      end

      context 'PATCH #update' do
        before do
          patch :update, id: user, user: attributes_for(:user)
        end

        # 要求された@userを取得すること
        it 'assigns the requested user to @user' do
          user.reload
          expect(assigns(:user)).to eq(user)
        end

        # @userの属性を変更すること
        it 'changes @user’s attribtues' do
          patch :update, id: user, user: attributes_for(:user, name: 'Kaiki Hamaguchi')
          user.reload
          expect(user.name).to eq('Kaiki Hamaguchi')
        end

        # updateメソッドが実行された後にroot_pathに飛ぶか
        it "redirects root path" do
          patch :update, id: user, user: attributes_for(:user)
          expect(response).to redirect_to root_path
        end
      end

  end
end

