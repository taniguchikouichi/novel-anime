require 'rails_helper'

RSpec.describe Label, "model_test", type: :model do
    describe 'アソシエーション' do
        it "has_many novels" do
            is_expected.to have_many(:novels)
        end
    end

    describe 'バリデーション' do
        context '保存できない場合' do
            it "label_nameが空欄" do
                expect(build(:label, :no_label_name)).to_not be_valid
            end
        end
    end
end