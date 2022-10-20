require 'rails_helper'
require_relative('../app/models/user')
require_relative('../app/models/post')

describe User, type: :model do
  subject { User.new(name: 'Fred Flinstone', photo: 'https://fake-site/', bio: 'Just a dude') }

  it 'title should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
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