require 'rails_helper'

describe Comment, type: :model do
  user = User.new(name: 'Fred Flinstone', photo: 'https://fake-site/', bio: 'Just a dude')
  post = Post.new(author: user, title: 'Title', text: 'Some Text Bla Bla!!!')
  subject { Comment.new(post:, author: user, text: 'AAAA') }

  it 'increments comment counter of post' do
    subject.send(:update_comments_counter)
    expect(post.comments_counter).to eq 1
  end
end
