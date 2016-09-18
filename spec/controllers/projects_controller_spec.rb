require 'rails_helper'
RSpec.describe ProjectsController, type: :controller do
  let(:project) {create(:project)}
  let(:params) {{ id: project, project: attributes_for(:project)}}
  let(:invalid_params) {{ id: project, project: attributes_for(:project, nil)}}
  describe 'with user login' do
    login_user
    context 'GET #index' do
      before do
        get :index, id: project
      end
      # indexアクションが動いたあとに正しくviewが表示されるか確かめる
      it 'renders the index template' do
        expect(response).to render_template("index")
      end
    end

    context 'GET #new' do
      before do
        get :new
      end
      # 新しいprojectを割り当てる
      it 'assigns the requested project to @project' do
        expect(assigns(:project)).to be_a_new(Project)
      end
      # newアクションが動いたあとに正しくviewが表示されるか確かめる
      it 'renders the new template' do
        expect(response).to render_template("new")
      end
    end

    context 'POST #create' do
      before do
        post :create, params
      end
      context 'with valid attribtues' do
        # データベースに新しいprojectが保存されるか確かめる
        it 'saves the new project in the database' do
          expect { post :create, params }.to change(Project, :count).by(1)
        end
        # createアクションが動いた後にroot_pathに飛ぶか
        it 'redirects to root_path' do
          expect(response).to redirect_to root_path
        end
        # フラッシュメッセージが表示されるか
        it 'shows flash messages to show save the project successfully' do
          expect(flash[:notice]).to eq 'Prototype was successfully create'
        end
      end
    end

    context 'GET #show' do
      before do
        get :show, id: project
      end
      # インスタンス変数が正しくセットされるか
      it 'assigns the requested project to @project' do
        expect(assigns(:project)).to eq project
      end
      # コメントが正しくセットされるか
      it 'assigns the requested comment to @comment' do
        expect(assigns(:comment)).to be_a_new(Comment)
      end
      # showアクションが動いたあとに正しくviewが表示されるか確かめる
      it 'renders the show template' do
        expect(response).to render_template("show")
      end
    end

    context 'GET #edit' do
      before do
        get :edit, id: project
      end
      # インスタンス変数が正しくセットされるか
      it 'assigns the requested project to @project' do
        expect(assigns(:project)).to eq project
      end
      # editアクションが動いたあとに正しくviewが表示されるか確かめる
      it 'renders the show template' do
        expect(response).to render_template("edit")
      end
    end

    context 'PATCH #update' do
      before do
        patch :update, params
      end
      context 'with valid attribtues' do
        # インスタンス変数が正しくセットされるか
        it 'assigns the requested project to @project' do
          expect(assigns(:project)).to eq project
        end
        # projectのtitleをupdateさせることができるか
        it 'updates attributes of project' do
          @project = create(:project, title: '梅田')
          project.reload
          expect(@project.title).to eq ('梅田')
        end
        # updateアクションが動いた後にprojects_pathに飛ぶか
        it 'redirects to projects_path' do
          expect(response).to redirect_to projects_path
        end
        # updateが成功したときフラッシュメッセージが表示されるか確かめる
        it 'shows flash messages to show update the project successfully' do
          expect(flash[:notice]).to eq 'Prototype was successfully updated.'
        end
      end

      context 'with invalid attribtues' do
        before do
          patch :update, invalid_params
        end
        # インスタンス変数が正しくセットされるか
        it 'assigns the requested project to @project' do
          expect(assigns(:project)).to eq project
        end
        # updateアクションが動いた後にprojects_pathに飛ぶか
        it 'redirects to projects_path' do
          expect(response).to redirect_to projects_path
        end
      end

    context 'DELETE #destroy' do
      before do
        delete :destroy, id: project
      end
      # インスタンス変数が正しくセットされるか
      it 'assigns the requested project to @project' do
        expect(assigns(:project)).to eq project
      end
      # projectを削除できるか確かめる
      it 'delete the project' do
        expect{ project.destroy }.to change(Project, :count).by(-1)
      end
      # destroyアクションが動いたあとに正しくviewが表示されるか確かめる
      it 'redirects to projects_path' do
        expect(response).to redirect_to projects_path
      end
      # 削除が成功した後にフラッシュメッセージが表示されるか確かめる
      it 'shows flash messages to show delete the project successfully' do
        expect(flash[:notice]).to eq 'Prototype was successfully deleted.'
      end
    end
  end
end
  # 以下ログインしていない場合リダイレクトされることを各アクションごとに確認している
  describe 'without user login' do
    context 'GET #new' do
      it 'redirects sign_in page' do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'POST #create' do
      it 'redirects sign_in page' do
        post :create
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'GET #edit' do
      it 'redirects sign_in page' do
        get :edit, id: project
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'PATCH #update' do
      it 'redirects sign_in page' do
        patch :update, params
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'DELETE #destroy' do
      it 'redirects sign_in page' do
        delete :destroy, id: project
        expect(response).to redirect_to new_user_session_path
      end
    end

  end



end
