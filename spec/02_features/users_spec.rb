# require 'rails_helper'
# RSpec.describe 'ログインとログアウト', type: :feature do
#     before "user作成" do
#         User.create!(email: 'test@example.com', password: '012345', name: "テスト太郎" )
#     end
#     scenario 'ログイン' do
#         visit user_session_path
#         fill_in 'user_email', with: 'test@example.com'
#         fill_in 'user_password', with: '012345'
#         click_on 'ログインする'
#         expect(page).to have_content 'ログインしました'
#     end
# end
