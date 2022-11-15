require 'rails_helper'

RSpec.describe 'User view', type: :system do
  before(:all) do
    lilly = User.create(name: 'Lilly',
                        photo: 'https://randomuser.me/api/portraits/women/40.jpg',
                        bio: 'Teacher from Poland.')
    User.create(name: 'Tom',
                photo: 'https://randomuser.me/api/portraits/men/92.jpg',
                bio: 'Teacher from Mexico.')
<<<<<<< HEAD
    Post.create(author: lilly, title: 'new post', text: 'I love posting')
=======
    @first_post = Post.create(author: lilly, title: 'new post', text: 'I love posting')
>>>>>>> 70ca49fcd027ac4c7ad9e44859a4720046f5a6cb
    Post.create(author: lilly, title: 'second post', text: 'yeahhh')
    Post.create(author: lilly, title: 'third post', text: 'uuuu')
    Post.create(author: lilly, title: 'fourth post', text: 'eee')
  end

  describe 'index page' do
    it 'shows the users names' do
      visit users_path
      expect(page).to have_content('Tom')
      expect(page).to have_content('Lilly')
    end

    it 'shows the users profile picture' do
      visit users_path
      images = page.all('img')
<<<<<<< HEAD
      expect(images[0]['src']).to have_content('https://randomuser.me/api/portraits/men/92.jpg')
      expect(images[1]['src']).to have_content('https://randomuser.me/api/portraits/women/40.jpg')
=======
      sources = [images[0]['src'], images[1]['src']]
      expect(sources.include?('https://randomuser.me/api/portraits/men/92.jpg')).to be true
      expect(sources.include?('https://randomuser.me/api/portraits/women/40.jpg')).to be true
>>>>>>> 70ca49fcd027ac4c7ad9e44859a4720046f5a6cb
    end

    it 'shows the number of posts each user has written' do
      visit users_path
<<<<<<< HEAD
      posts_counter = page.all('.posts-counter')
      expect(posts_counter[0]).to have_content('Number of posts: 0')
      expect(posts_counter[1]).to have_content('Number of posts: 4')
=======
      expect(page).to have_content('Number of posts: 0')
      expect(page).to have_content('Number of posts: 4')
>>>>>>> 70ca49fcd027ac4c7ad9e44859a4720046f5a6cb
    end

    it 'when I click on a user, I am redirected to that users show page' do
      visit users_path
<<<<<<< HEAD
      link = page.first('a')
      link.click
      expect(page).to have_current_path('/users/2')
=======
      find("a[href='/users/1']").click
      expect(page).to have_current_path('/users/1')
>>>>>>> 70ca49fcd027ac4c7ad9e44859a4720046f5a6cb
    end
  end

  describe 'user show page' do
    it 'shows the users profile picture' do
      visit '/users/1'
      img = page.find('img')
      expect(img['src']).to have_content('https://randomuser.me/api/portraits/women/40.jpg')
    end

    it 'shows the users username' do
      visit '/users/1'
      username = page.find('.user-name')
      expect(username).to have_content('Lilly')
    end

    it 'shows the users posts counter' do
      visit '/users/1'
      posts_counter = page.find('.posts-counter')
      expect(posts_counter).to have_content('Number of posts: 4')
    end

    it 'shows the users bio' do
      visit '/users/1'
      bio = page.find('.user-bio')
      expect(bio).to have_content('Teacher from Poland.')
    end

    it 'shows the users first 3 posts' do
      visit '/users/1'
      posts = page.all('.post')
      expect(posts[0]).to have_content('fourth post')
      expect(posts[1]).to have_content('uuuu')
      expect(posts[2]).to have_content('second post')
    end
  end
end
