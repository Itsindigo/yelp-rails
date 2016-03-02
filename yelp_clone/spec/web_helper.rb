def signup
  visit '/restaurants'
  click_link 'Sign up'
  fill_in 'Email', with: 'test@test.com'
  fill_in 'Password', with: 'testtest'
  fill_in 'Password confirmation', with: 'testtest'
  click_button 'Sign up'
end

def create_restaurant
  click_link 'Add restaurant'
  fill_in 'Name', with: 'Java-U'
  click_button 'Create Restaurant'
end

def edit_restaurant
  click_link 'Edit Java-U'
  fill_in 'Name', with: 'Java-Me'
  click_button 'Update Restaurant'
end

def login
  visit '/restaurants'
  click_link 'Sign in'
  fill_in 'Email', with: 'test@test.com'
  fill_in 'Password', with: 'testtest'
  click_button 'Log in'
end
