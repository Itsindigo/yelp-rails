def signup
  visit '/restaurants'
  click_link 'Sign up'
  fill_in 'Email', with: 'test@test.com'
  fill_in 'Password', with: 'testtest'
  fill_in 'Password confirmation', with: 'testtest'
  click_button 'Sign up'
end

def login
  visit '/restaurants'
  click_link 'Sign in'
  fill_in 'Email', with: 'test@test.com'
  fill_in 'Password', with: 'testtest'
  click_button 'Log in'
end
