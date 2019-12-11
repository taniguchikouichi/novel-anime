require 'rails_helper'
RSpec.describe 'AdminNovel', type: :feature do
    before "admin,genre,label" do
        Admin.create!(email: 'admin@example.com', password: '123456')
        Genre.create!(genre_name: 'genre')
        Label.create!(label_name: 'label')
    end
    scenario '小説追加、編集、削除、エラー、サクセスメッセージの確認' do
        # 管理者ログイン
        visit admin_session_path
        fill_in 'admin_email', with: 'admin@example.com'
        fill_in 'admin_password', with: '123456'
        click_on 'ログインする'
        click_on '小説追加へ'
        select 'genre', from: 'novel_genre_combinations_attributes_0_genre_id'
        select 'label', from: 'novel_label_id'
        fill_in 'novel_url', with: 'http://test.com'
        fill_in 'novel_title', with: 'test'
        fill_in 'novel_explanation', with: 'testtest'
        click_on '保存する'
        # サクセスメッセージの表示
        expect(page).to have_content "小説を作成しました"
        # 編集
        click_on '編集画面へ'
        select 'genre', from: 'novel_genre_combinations_attributes_0_genre_id'
        select 'label', from: 'novel_label_id'
        fill_in 'novel_url', with: 'http://test.com'
        fill_in 'novel_title', with: 'テスト'
        fill_in 'novel_explanation', with: 'テストテスト'
        click_on '保存する'
        # サクセスメッセージの表示
        expect(page).to have_content "小説を編集しました"
        # 小説追加画面に移動
        visit new_admin_novel_path
        # 空欄での投稿
        click_on '保存する'
        # エラーメッセージの表示
        expect(page).to have_content "入力してください"
    end
end