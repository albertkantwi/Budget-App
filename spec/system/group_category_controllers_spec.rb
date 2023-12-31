require 'rails_helper'
RSpec.describe 'GroupCategories', type: :system do
  include Devise::Test::IntegrationHelpers
  before(:each) do
    @user = User.create(
      full_name: 'Albert',
      email: 'albertkantwi@gmail.com',
      password: 'password'
    )
    @category = GroupCategory.create(
      user_id: @user.id,
      name: 'Albert',
      icon: GroupCategory::ICONS.keys.first
    )
    sign_in @user
  end
  describe 'GroupCategory Index' do
    before(:each) do
      visit group_categories_path
    end
    it 'should display the category name' do
      expect(page).to have_content(@category.name)
    end
    it 'should display the category icon' do
      expect(page).to have_css('i')
    end
    it 'should display the total amount for each category' do
      expect(page).to have_content(@category.total_amount)
    end
  end
  describe 'GroupCategory Show' do
    before(:each) do
      visit group_category_entity_categories_path(@category)
    end
    it 'should navigate to the "Add transaction" page when clicking on "Add transaction"' do
      expect(page).to have_link('ADD TRANSACTION', href: new_group_category_entity_category_path(@category))
    end
  end
end
