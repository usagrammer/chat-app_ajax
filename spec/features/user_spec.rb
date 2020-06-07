require 'rails_helper'

feature 'ユーザーログイン機能', type: :feature do
  scenario 'ログインしていない場合、サインページに移動する' do
    # 予め、ユーザーをDBに保存する
    @user = FactoryBot.create(:user)

    # トップページに遷移させる
    visit root_path

    # ログインしていない場合、サインインページに遷移することを期待する
    expect(current_path).to eq new_user_session_path
  end

  scenario 'ログインに成功し、ルートパスに遷移する' do
    # 予め、ユーザーをDBに保存する
     @user = FactoryBot.create(:user)

     # トップページに遷移させる
     visit root_path

     # ログインしていない場合、サインインページに遷移することを期待する
     expect(current_path).to eq new_user_session_path

     # すでに保存されているユーザーのnameとemailを入力する
     fill_in 'user_email', with: @user.email
     fill_in 'user_password', with: @user.password

     # ログインボタンをクリックする
     click_on("Log in")

     # ルートページに遷移することを期待する
     expect(current_path).to eq root_path
   end

  scenario 'ログインに失敗し、再びサインインページに戻ってくる' do
    # 予め、ユーザーをDBに保存する

    # トップページに遷移させる

    # ログインしていない場合、サインインページに遷移する

    # 誤ったユーザー情報を入力する

    # ログインボタンをクリックする

    # サインインページに遷移していることを期待する

  end

  scenario 'ログインに失敗し、再びサインインページに戻ってくる' do

    visit new_user_session_path

    # 誤ったユーザー情報を入力する
    fill_in 'user_email', with: "test"
    fill_in 'user_password', with: "example@test.com"

    # ログインボタンをクリックする
    click_on("Log in")

    # サインインページに遷移していることを期待する
    expect(current_path).to eq  new_user_session_path
  end

end
