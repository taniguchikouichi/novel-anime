require 'rails_helper'

RSpec.describe GenreCombination, "model_test", type: :model do
    describe 'アソシエーション' do
        it "belongs_to genre" do
            is_expected.to belong_to(:genre)
        end

        it "belongs_to novel" do
            is_expected.to belong_to(:novel)
        end
    end
end