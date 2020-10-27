describe 'Sign up process', type: :feature do
  it 'Sign up to the app' do
    visit '/users/sign_up'
    fill_in 'user[username]', with: 'izhan'
    fill_in 'user[email]', with: 'izhan@mail.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  it 'Display errors messages for invalid values' do
    visit '/users/sign_up'
    fill_in 'user[username]', with: 'affan'
    click_button 'Sign up'
    expect(page).to have_content 'Email can\'t be blank'
  end
end
