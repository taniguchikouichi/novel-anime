require 'rails_helper'
RSpec.describe 'ログイン、ログアウト', type: :feature do
    before "user作成" do
        User.create!(email: 'test@example.com', password: '012345', name: "テスト太郎" )
    end
    scenario 'ログイン' do
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
end
