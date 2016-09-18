require 'rails_helper'

feature 'login and logout' do
  background do                                                        #backgroundはbeforeと同じ
    # ユーザを作成する
    User.create!(name: 'kaiki', email: 'kaiki@gmail.com', password: '00000000')
  end

  scenario 'new user' do
    # トップページを開く
    visit root_path
    click_on 'Get Started'
    click_on 'Sign up now'
    # ログインフォームにEmailとパスワードを入力する
    fill_in 'NAME', with: 'kaiki'
    attach_file 'avatar', "#{Rails.root}/spec/factories/sakana.jpg"
    fill_in 'email', with: 'kaiki@example.com'
    fill_in 'password', with: '00000000'
    fill_in 'Member', with: 'TECHCAMP梅田'
    fill_in 'Profile', with: '大学生'
    fill_in 'works', with: 'TECHCAMPメンター'
    # 新規登録ボタンを押す
    click_on 'SAVE'
    # 新規登録に成功したことを検証する。
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end


  scenario 'login' do
    # トップページを開く
    visit root_path
    click_on 'Get Started'
    # ログインフォームにEmailとパスワードを入力する
    fill_in 'email', with: 'kaiki@gmail.com'
    fill_in 'password', with: '00000000'
    # ログインボタンをクリックする
    click_on 'Sign in'
    # ログインに成功したことを検証する
    expect(page).to have_content 'Signed in successfully.'
    # プロトタイプ投稿画面を開く
    visit new_project_path
    # プロトタイプ投稿フォームにtitle、画像、CatchCopy、Conceptを入力する。
    fill_in 'Title', with: 'TECHCAMP'
    attach_file 'main_image', "#{Rails.root}/spec/factories/sakana.jpg"
    attach_file 'sub_image1', "#{Rails.root}/spec/factories/sakana.jpg"
    attach_file 'sub_image2', "#{Rails.root}/spec/factories/sakana.jpg"
    fill_in 'Catch Copy', with: '人生を変える1ヶ月'
    fill_in 'Concept', with: '初心者が1ヶ月でサービスを作れる'
    # 投稿完了ボタンをクリックする
    click_on 'Publish'
  end

  scenario 'logout' do
    # トップページを開く
    visit root_path
    click_on 'Get Started'
    # ログインフォームにEmailとパスワードを入力する
    fill_in 'email', with: 'kaiki@gmail.com'
    fill_in 'password', with: '00000000'
    # ログインボタンをクリックする
    click_on 'Sign in'
    # ログインに成功したことを検証する
    expect(page).to have_content 'Signed in successfully.'
    # ログアウトボタンをクリックする
    click_on 'logout'
  end
end
