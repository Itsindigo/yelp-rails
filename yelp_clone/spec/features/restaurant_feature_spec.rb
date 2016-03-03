require 'rails_helper'
require 'web_helper'

feature 'Restaurants' do
  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
        visit '/restaurants'
        expect(page).to have_content('No restaurants have been added')
        expect(page).to have_link('Add a restaurant')
    end
  end

  context 'creating restaurants' do
    scenario 'prompt users to fill out a form to create a new restaurant' do
        signup
        click_link 'Add a restaurant'
        fill_in 'Name', with: 'Cafe Rouge'
        click_button 'Create Restaurant'
        expect(page).to have_content('Cafe Rouge')
        expect(current_path).to eq('/restaurants')
    end

    scenario 'does not let you submit a name that is too short' do
      signup
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'x'
      click_button 'Create Restaurant'
      expect(page).not_to have_css 'h2', text: 'x'
      expect(page).to have_content('error')
    end
  end

  context 'viewing restaurants' do

    let!(:cafe_rouge){Restaurant.create(name: 'Cafe Rouge')}

    scenario 'lets a user view a restaurant' do
      visit '/restaurants'
      click_link 'Cafe Rouge'
      expect(page).to have_content('Cafe Rouge')
      expect(current_path).to eq("/restaurants/#{cafe_rouge.id}")
    end
  end

  context 'editing restaurants' do

    before { Restaurant.create(name: 'Cafe Rouge') }

    scenario 'does not let users edit restaurants other than their own' do
      signup
      expect(page).not_to have_link 'Edit Cafe Rouge'
    end

    scenario 'allows users to edit own restaurants' do
      signup
      create_restaurant
      edit_restaurant
      expect(page).to have_content 'Java-Me'
    end
  end

  context 'deleting restaurants' do

    before {Restaurant.create name: 'KFC'}

    scenario 'removes a restaurant when a user clicks a delete link' do
      signup
      create_restaurant
      click_link 'Delete Java-U'
      expect(page).not_to have_content 'Java-U'
      expect(page).to have_content 'Restaurant deleted successfully'
    end
  end
end
