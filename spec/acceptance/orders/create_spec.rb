require 'rails_helper'

feature 'User can create order' do
  # describe 'Authenticated user', js: true do
  #   background do

  #   end
  
  #   scenario 'create answer' do

  #   end
  
  #   scenario 'tries create answer with errors' do

  #   end
  # end

  scenario 'User create order', js: true do
    visit root_path
    fill_in 'Length', with: 150
    fill_in 'Width', with: 150
    fill_in 'Height', with: 150
    fill_in 'Weight', with: 150
    fill_in 'Departure point', with: 'Moscow'
    fill_in 'Destination', with: 'Tyumen'

    click_on 'Create Order'

    within '.orders' do
      expect(page).to have_content 'Moscow'
      expect(page).to have_content 'Tyumen'
    end
  end
end
