require 'rails_helper'

feature 'User can log in' do

  given(:user) { create(:user) }

  background { visit new_user_session_path }

  scenario 'Registreted user tries to log in' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_on 'Log in'

    expect(page).to have_content "Signed in successfully."
  end

  scenario 'Unregistreted user tries to log in' do
    fill_in 'Email', with: 'wrong@eamil.com'
    fill_in 'Password', with: '123123'

    click_on 'Log in'

    expect(page).to have_content 'Invalid Email or password.'
  end
end
