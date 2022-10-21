require 'rails_helper'

describe Comment, type: :model do
  user = User.new(name: 'Fred Flinstone', photo: 'https://fake-site/', bio: 'Just a dude')
  post = Post.new(author: user, title: 'Title', text: 'Some Text Bla Bla!!!')
  subject { Like.new(post:, author: user) }

  it 'increments comment counter of post' do
    subject.send(:update_likes_counter)
    expect(post.likes_counter).to eq 1
  end
end
