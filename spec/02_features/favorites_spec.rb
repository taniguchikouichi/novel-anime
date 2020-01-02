# require 'rails_helper'
# RSpec.describe 'Favorite', type: :feature do
#     before "user,novel,genre,label作成" do
#         User.create!(email: 'test@example.com', password: '012345', name: "テスト太郎" )
#         Genre.create!(genre_name: 'genre')
#         Label.create!(label_name: 'label')
#         Novel.create!(title: 'testnovel', explanation: 'test', url: 'http://test.com', label_id: '1' )
#     end
#     scenario 'お気に入り登録', js: true do
#         # ログインページに移動
#         visit user_session_path
#         fill_in 'user_email', with: 'test@example.com'
#         fill_in 'user_password', with: '012345'
#         click_on 'ログインする'
#         click_on 'お気に入り'
#         click_on 'お気に入り一覧'
#         expect(page).to have_content "testnovel"
#     end
# end
