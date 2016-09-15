require 'rails_helper'
describe Project do
  describe 'associations' do
    context 'with comments' do
      #projectが削除された時、一緒にcommentも消えるか
      it "deletes the comments when project is deleted" do
        project = create(:project)
        comment = create(:comment, project: project)
        expect{ project.destroy }.to change{ Comment.count }.by(-1)
      end
    end
    context 'with likes' do
      #projectが削除された時、一緒にLikesも消えるか
      it "deletes the likes when project is deleted" do
        project = create(:project)
        comment = create(:like, project: project)
        expect{ project.destroy }.to change{ Like.count }
      end
    end
  end

  describe 'validations' do
    context "with valid attributes" do
       #title,catch_copy,conceptが存在すれば登録できること
      it "has a valid factory" do
        project = build(:project)
        expect(project).to be_valid
      end
    end
    context "without valid attributes" do
       # titleが空では登録できないこと
      it "is missing a title" do
        project = build(:project, title: nil)
        project.valid?
        expect(project.errors[:title]).to include("can't be blank")
      end
       # catch_copyが空では登録できないこと
      it "is missing a catch_copy" do
        project = build(:project, catch_copy: nil)
        project.valid?
        expect(project.errors[:catch_copy]).to include("can't be blank")
      end
       # conceptが空では登録できないこと
      it "is missing a concept" do
        project = build(:project, concept: nil)
        project.valid?
        expect(project.errors[:concept]).to include("can't be blank")
      end
    end
  end

  describe '#liked_by?(user)' do
    context "when liked by a user" do
      #インスタンスメソッドlike_userがtrueを返す
      it "returns true" do
        #ここに処理を書く
        user = build(:user)
        project = build(:project, user_id: user)
        create(:like, project: project)
        expect(project.like_user(user.id)).to be_truthy
      end
    end
    context "when not liked by a user" do
      #インスタンスメソッドlike_userがnilを返す
      it "returns nil" do
        #ここに処理を書く
        user = build(:user)
        project = build(:project, user_id: user)
        create(:like, project: project)
        expect(project.like_user(user.id)).not_to be_falsey
      end
    end
  end

end

