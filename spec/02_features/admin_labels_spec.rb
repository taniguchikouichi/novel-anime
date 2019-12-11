require 'rails_helper'
RSpec.describe 'AdminLabel', type: :feature do
    before "admin作成" do
        Admin.create!(email: 'admin@example.com', password: '123456')
    end
    scenario '出版社追加、削除、エラー、サクセスメッセージの確認' do
        # 管理者ログイン
        visit admin_session_path
        fill_in 'admin_email', with: 'admin@example.com'
        fill_in 'admin_password', with: '123456'
        click_on 'ログインする'
        click_on '出版社追加へ'
        fill_in 'label_label_name', with: 'test'
        click_on 'レーベルを作成する'
        # 追加後の一覧ページにtestというジャンルが作成されていること
        expect(page).to have_content "test"
        # サクセスメッセージの表示
        expect(page).to have_content "出版社を作成しました"
        click_on '削除'
        # 削除後の一覧ページにtestというジャンルが消えていること
        expect(page).to_not have_content "test"
        # サクセスメッセージの表示
        expect(page).to have_content "出版社を削除しました"
        # レーベル追加画面に移動
        visit new_admin_label_path
        # 空欄での投稿
        fill_in 'label_label_name', with: ''
        click_on 'レーベルを作成する'
        # エラーメッセージの表示
        expect(page).to have_content "出版社名を入力してください"
    end
end