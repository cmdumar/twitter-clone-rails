describe 'Login process', type: :feature do
  before :each do
    @user = User.create(username: 'rafiya', email: 'rafiya@gmail.com', password: '123456', password_confirmation: '123456')
  end

  it 'Login to the app' do
    visit '/users/sign_in'
    fill_in 'user[login]', with: @user.username
    fill_in 'user[password]', with: @user.password
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end
end