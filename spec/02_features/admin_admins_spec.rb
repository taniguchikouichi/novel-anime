require 'rails_helper'
RSpec.describe 'Admin', type: :feature do
    before "admin作成" do
        Admin.create!(email: 'admin@example.com', password: '123456')
    end
    scenario 'ログイン,ログアウト' do
        # ログインページに移動
        visit admin_session_path
        fill_in 'admin_email', with: 'admin@example.com'
        fill_in 'admin_password', with: '123456'
        click_on 'ログインする'
        # ログイン後の画面にはログアウトリンクが必ず存在する
        expect(page).to have_content 'ログアウト'
        click_on 'ログアウト'
        #  ログアウト後の画面にはログインリンクが存在する
        expect(page).to have_content 'ログイン'
    end
end