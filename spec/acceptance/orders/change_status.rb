require 'rails_helper'

feature 'Admin can change status of order' do

  given(:user) { create(:user, admin: true) }
  given!(:order) { create(:order) }

  background do
     login(user)
     visit admin_orders_path
  end

  scenario 'Admin chages status of order' do

    within "tr#order_#{order.id}" do
      click_on 'Confirm'
      order.reload
      expect(page).to have_content order.status
    end
    expect(page).to have_content 'Status successfully changed!'
  end
end
