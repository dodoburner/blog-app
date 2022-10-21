require 'rails_helper'
require_relative('../app/models/user')

describe User, type: :model do
  subject { User.new(name: 'Fred Flinstone', photo: 'https://fake-site/', bio: 'Just a dude') }

  it 'title should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  
  it 'posts counter should be initialized as 0' do
    expect(subject.posts_counter).to eq 0
  end

  it 'posts counter should be a integer' do
    subject.posts_counter = 'Text'
    expect(subject).to_not be_valid
  end

  it 'posts counter should be greater or equal to zero' do
    subject.posts_counter = -5
    expect(subject).to_not be_valid
  end
end