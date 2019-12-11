require 'rails_helper'
RSpec.describe 'AdminUser', type: :feature do
    before "admin,user作成" do
        Admin.create!(email: 'admin@example.com', password: '123456')
        User.create!(email: 'user@example.com', password: 'abcdef', name: 'test')
    end
    scenario 'ユーザー編集、削除、サクセスメッセージの確認' do
        visit admin_session_path
        fill_in 'admin_email', with: 'admin@example.com'
        fill_in 'admin_password', with: '123456'
        click_on 'ログインする'
        click_on 'ユーザー一覧へ'
        click_on '編集画面へ'
        fill_in 'user_name', with: 'テスト太郎'
        click_on '保存する'
        # サクセスメッセージの表示
        expect(page).to have_content "ユーザーを編集しました"
        visit admin_users_path
        click_on '編集画面へ'
        click_on '削除する'
        # サクセスメッセージの表示
        expect(page).to have_content "ユーザーを削除しました"
    end
end