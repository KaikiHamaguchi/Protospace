require 'rails_helper'

feature 'login and logout' do
  background do                                                        #backgroundはbeforeと同じ
    # ユーザを作成する
    User.create!(name: 'kaiki', email: 'kaiki@gmail.com', password: '00000000')
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
