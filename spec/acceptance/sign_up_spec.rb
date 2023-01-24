require 'rails_helper'

feature 'User can sign up' do

  background { visit new_user_registration_path }

  describe 'User signs up' do
    background do
      fill_in 'Email', with: 'example@mail.com'
      fill_in 'Phone number', with: '79000000000'
      fill_in 'First name', with: 'Ilia'
      fill_in 'Last name', with: 'Palaguto'
      fill_in 'Password', with: '111111'
      fill_in 'Password confirmation', with: '111111'
    end
    scenario 'as usual user' do
      select 'King Arthur', from: 'Who is the author of Ruby language?'

      click_on 'Sign up'
  
      expect(page).to have_content 'Welcome! You have signed up successfully.'
      expect(page).to_not have_link 'Admin panel'
    end

    scenario 'as admin' do
      select 'Matz', from: 'Who is the author of Ruby language?'

      click_on 'Sign up'

      expect(page).to have_content 'Welcome! You have signed up successfully.'
      expect(page).to have_link 'Admin panel'
    end
  end

  scenario 'User tries sign up with errors' do
    fill_in 'Email', with: 'example@mail.com'
    fill_in 'Password', with: '111111'
    fill_in 'Password confirmation', with: '222222'

    click_on 'Sign up'

    expect(page).to have_content "Password confirmation doesn't match Password"
  end
end
