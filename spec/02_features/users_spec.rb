require 'rails_helper'
RSpec.describe 'ログインとログアウト', type: :feature do
    before do
        # user作成
        # User.create!(email: 'test@example.com', password: '012345')
    end
    scenario 'ログイン' do
        visit user_session_path
        fill_in 'Email', with: 'test@example.com'
        fill_in 'Password', with: '012345'
        click_on 'Log in'
        expect(page).to have_content 'ログインしました'
    end
end
