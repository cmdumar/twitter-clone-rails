require 'rails_helper'

RSpec.describe Opinion, type: :model do
  before :each do
    @user = User.create(username: 'umar', email: 'umar@mail.com', password: '123456', password_confirmation: '123456')
    @post = @user.opinions.build(content: 'hello, this a post for testing')
  end

  it { should belong_to(:user) }
  it { should have_many(:comments) }

  it 'returns opinion created by user' do
    expect(@user.opinions.first).to eq(@post)
  end
end