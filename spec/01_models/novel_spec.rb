require 'rails_helper'

RSpec.describe Novel, "model_test", type: :model do
    describe 'アソシエーション' do
        it "hasmany review" do
            is_expected.to have_many(:reviews)
        end
        it "hasmany favorite" do
            is_expected.to have_many(:favorites)
        end
        it "hasmany genre_combinations" do
            is_expected.to have_many(:genre_combinations)
        end
        it "belongs_to label" do
            is_expected.to belong_to(:label)
        end
    end

    describe '保存' do
        context '保存できる場合' do
            it "label_idを入れて保存" do
                label = create(:label)
                expect(create(:novel, label_id: label.id)).to be_valid
            end
        end
        context 'バリデーション' do
            it "titleが空欄" do
                expect(build(:novel, :no_title)).to_not be_valid
            end
            it "explanationが空欄" do
                expect(build(:novel, :no_explanation)).to_not be_valid
            end
        end
    end
end