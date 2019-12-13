require 'rails_helper'
RSpec.describe 'User', type: :feature do
    before "user作成" do
        User.create!(email: 'test@example.com', password: '012345', name: "テスト太郎" )
    end
    scenario 'ログイン、ログアウト' do
        # ログインページに移動
        visit user_session_path
        fill_in 'user_email', with: 'test@example.com'
        fill_in 'user_password', with: '012345'
        click_on 'ログインする'
        # ログイン後の画面にはログアウトリンクが必ず存在する
        expect(page).to have_content 'ログアウト'
        click_on 'ログアウト'
        #  ログアウト後の画面にはログインリンクが存在する
        expect(page).to have_content 'ログイン'
    end
    scenario 'ユーザー編集、退会' do
        visit user_session_path
        fill_in 'user_email', with: 'test@example.com'
        fill_in 'user_password', with: '012345'
        click_on 'ログインする'
        # ユーザー編集画面へ移動
        click_on 'ようこそ、 テスト太郎さん'
        fill_in 'user_name', with: 'テスト'
        click_on '保存する'
        # 編集後のサクセスメッセージ
        expect(page).to have_content '名前を変更しました'
        click_on 'ようこそ、 テストさん'
        click_on '退会する'
        # # 退会後のサクセスメッセージ
        expect(page).to have_content '退会しました'
    end
end
