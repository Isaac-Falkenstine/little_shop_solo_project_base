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
      it 'should show a slug in the name' do
        visit items_path

        click_on("#{@item.name}")
        # save_and_open_page
        expect(current_path).to eq("/items/#{@item.name}")
      end
    end
  end
end
