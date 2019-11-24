require 'rails_helper'
RSpec.describe User, "model test", type: :model do
    describe 'アソシエーション' do
        it "has_many favorites" do
            is_expected.to have_many(:favorites)
        end
        it "has_many reviews" do
            is_expected.to have_many(:reviews)
        end
        it "has_many novels" do
            is_expected.to have_many(:novels)
        end
    end
end