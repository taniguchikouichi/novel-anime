require 'rails_helper'

RSpec.describe Favorite, "model_test", type: :model do
    describe 'association' do
        it "belongs_to user" do
            is_expected.to belong_to(:user)
        end
        it "belongs_to novel" do
            is_expected.to belong_to(:novel)
        end
    end
end