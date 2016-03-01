require 'rails_helper'

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
        visit '/restaurants'
        click_link 'Add a restaurant'
        fill_in 'Name', with: 'Cafe Rouge'
        click_button 'Create Restaurant'
        expect(page).to have_content('Cafe Rouge')
        expect(current_path).to eq('/restaurants')
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

    scenario 'let a user edit a restaurant' do
      visit '/restaurants'
      click_link 'Edit Cafe Rouge'
      fill_in 'Name', with: 'Cafe Rouge Restaurant'
      click_button 'Update Restaurant'
      expect(current_path).to eq '/restaurants'
    end
  end

  context 'deleting restaurants' do

    before {Restaurant.create name: 'KFC'}

    scenario 'removes a restaurant when a user clicks a delete link' do
      visit '/restaurants'
      click_link 'Delete KFC'
      expect(page).not_to have_content 'KFC'
      expect(page).to have_content 'Restaurant deleted successfully'
    end
  end
end
