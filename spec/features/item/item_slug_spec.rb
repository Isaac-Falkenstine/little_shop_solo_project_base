require 'rails_helper'

RSpec.describe 'Item Slug' do
  context 'as a user' do
    before(:each) do
      @merchant = create(:merchant)
      @item = create(:item, user: @merchant)
      @user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    describe 'visiting /items' do
      it 'should show all active items' do
        visit items_path
        save_and_open_page
      end
    end
  end
end
