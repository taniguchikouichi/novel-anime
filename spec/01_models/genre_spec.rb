require 'rails_helper'

RSpec.describe Genre, "model_test", type: :model do
    describe 'association' do
        it "has_many genre_combinations" do
            is_expected.to have_many(:genre_combinations)
        end
    end

    describe 'バリデーション' do
        context '保存できない場合' do
            it "genre_nameが空欄" do
                expect(build(:novel, :no_genre_name)).to_not be_valid
            end
        end
    end
end


