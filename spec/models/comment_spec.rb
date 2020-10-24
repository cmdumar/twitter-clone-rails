require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    @user = User.create(username: 'umar123', email: 'umar123@gmail.com', password: '123456', password_confirmation: '123456')
    @opinion = @user.opinions.build(content: 'hello, this a opinion for testing')
    @comment = @opinion.comments.build(text: 'This is the best opinion ever!')
  end

  it { should belong_to(:opinion) }
  it { should belong_to(:user) }

  it 'returns comment in opinion' do
    expect(@opinion.comments.first).to eql(@comment)
  end
end