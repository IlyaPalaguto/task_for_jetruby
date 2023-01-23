require 'rails_helper'

feature 'User can create order' do
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
      expect(page).to have_content 'Moscow - Tyumen', wait: 10
    end
  end

  scenario 'User tries create order with errors', js: true do
    visit root_path
    click_on 'Create Order'
    expect(page).to have_content "Width can't be blank"
  end
end
