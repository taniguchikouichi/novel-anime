require 'rails_helper'
RSpec.describe Review, "model_test", type: :model do
    describe 'association' do
        it "belongs_to user" do
            is_expected.to belong_to(:user)
        end
        it "belongs_to novel" do
            is_expected.to belong_to(:novel)
        end
    end
    describe 'バリデーション' do
        context "保存できない場合" do
            it "titleが空欄" do
                expect(build(:review, :no_title)).to_not be_valid
            end
            it "textが空欄" do
                expect(build(:review, :no_text)).to_not be_valid
            end
            it "story_rateが空欄" do
                expect(build(:review, :no_story_rate)).to_not be_valid
            end
            it "production_rateが空欄" do
                expect(build(:review, :no_production_rate)).to_not be_valid
            end
            it "setting_rateが空欄" do
                expect(build(:review, :no_setting_rate)).to_not be_valid
            end
            it "person_rateが空欄" do
                expect(build(:review, :no_person_rate)).to_not be_valid
            end
        end
    end         
end