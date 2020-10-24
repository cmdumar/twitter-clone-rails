require 'rails_helper'

RSpec.describe Following, type: :model do
  before :each do
    @user = User.create(username: 'raiyan', email: 'raiyan@mail.com', password: '123456',
                        password_confirmation: '123456')
    @user2 = User.create(username: 'umar28', email: 'umar28@mail.com', password: '123456',
                         password_confirmation: '123456')
    @user.follow(@user2)
  end

  it { should belong_to(:follower) }
  it { should belong_to(:followed) }

  it 'returns a user whose being followed' do
    expect(@user.following.first).to eq(@user2)
  end

  it 'returns a users followers' do
    expect(@user2.followers.first).to eq(@user)
  end
end
