require 'rails_helper'
RSpec.describe 'AdminGenre', type: :feature do
    before "admin作成" do
        Admin.create!(email: 'admin@example.com', password: '123456')
    end
    scenario 'ジャンル追加、削除、動作確認' do
        # 管理者ログイン
        visit admin_session_path
        fill_in 'admin_email', with: 'admin@example.com'
        fill_in 'admin_password', with: '123456'
        click_on 'ログインする'
        # ジャンル追加ページに遷移
        click_on 'ジャンル追加へ'
        fill_in 'genre_genre_name', with: 'test'
        click_on 'ジャンルを作成する'
        # 追加後の一覧ページにtestというジャンルが作成されていること
        expect(page).to have_content "test"
        # サクセスメッセージの表示
        expect(page).to have_content "ジャンルを作成しました"
        click_on '削除'
        # 削除後の一覧ページにtestというジャンルが消えていること
        expect(page).to_not have_content "test"
        # サクセスメッセージの表示
        expect(page).to have_content "ジャンルを削除しました"
        # ジャンル追加画面に移動
        visit new_admin_genre_path
        # 空欄での投稿
        fill_in 'genre_genre_name', with: ''
        click_on 'ジャンルを作成する'
        # エラーメッセージの表示
        expect(page).to have_content "ジャンル名を入力してください"
    end
end