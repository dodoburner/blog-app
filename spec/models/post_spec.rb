require 'rails_helper'

describe Post, type: :model do
  user = User.new(name: 'Fred Flinstone', photo: 'https://fake-site/', bio: 'Just a dude')
  subject { Post.new(author: user, title: 'Title', text: 'Some Text Bla Bla!!!') }

  it 'has a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'the title is under 250char' do
    subject.title = 'a' * 260
    expect(subject).to_not be_valid
  end

  it 'the comments counter is intialized as 0' do
    expect(subject.comments_counter).to eq 0
  end

  it 'the likes counter is initialized as 0' do
    expect(subject.likes_counter).to eq 0
  end
  it 'the comments counter is an integer' do
    subject.comments_counter = 'a'
    expect(subject).to_not be_valid
  end

  it 'the likes counter is an integer' do
    subject.likes_counter = 'a'
    expect(subject).to_not be_valid
  end

  it 'the comments counter is greater or equal to zero' do
    subject.comments_counter = -5
    expect(subject).to_not be_valid
  end

  it 'the likes counter is greater or equal to zero' do
    subject.likes_counter = -5
    expect(subject).to_not be_valid
  end

  it 'increments post counter of author' do
    subject.send(:update_posts_counter)
    expect(user.posts_counter).to eq 1
  end
end
