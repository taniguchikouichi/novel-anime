require 'rails_helper'
RSpec.describe Review, "model_test", type: :model do
    describe 'アソシエーション' do
        it "belongs_to user" do
            is_expected.to belong_to(:user)
        end
        it "belongs_to novel" do
            is_expected.to belong_to(:novel)
        end
    end
    describe 'バリデーション' do
        context "保存できない場合" do
            user=nil
            novel=nil
            before "準備（暫定）" do
                user = User.new(name:'name',email:"test@test",password:"password",
                    sign_in_count:1,)
                user.save
                label = create(:label)
                novel = Novel.new(title:'title',explanation:'explanation',url:'url',label_id:label.id)
                novel.save
            end
            it "titleが空欄" do
                #user = create(:user)
                #novel = create(:novel)

                expect(build(:review, :no_title,user_id:user.id,novel_id:novel.id)).to_not be_valid
            end
            it "textが空欄" do
                expect(build(:review, :no_text,user_id:user.id,novel_id:novel.id)).to_not be_valid
            end
            it "story_rateが空欄" do
                expect(build(:review, :no_story_rate,user_id:user.id,novel_id:novel.id)).to_not be_valid
            end
            it "production_rateが空欄" do
                expect(build(:review, :no_production_rate,user_id:user.id,novel_id:novel.id)).to_not be_valid
            end
            it "setting_rateが空欄" do
                expect(build(:review, :no_setting_rate,user_id:user.id,novel_id:novel.id)).to_not be_valid
            end
            it "person_rateが空欄" do
                expect(build(:review, :no_person_rate,user_id:user.id,novel_id:novel.id)).to_not be_valid
            end
        end
    end         
end