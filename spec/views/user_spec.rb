require 'rails_helper'

RSpec.describe 'User view', type: :system do
  before(:all) do
      User.create( name: "Lilly",
        photo: "https://randomuser.me/api/portraits/women/40.jpg",
        bio: "Teacher from Poland.",
        posts_counter: 2,)
      User.create(name: "Tom",
        photo: "https://randomuser.me/api/portraits/men/92.jpg",
        bio: "Teacher from Mexico.",
        posts_counter: 10,)
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
      expect(images[0]['src']).to have_content('https://randomuser.me/api/portraits/women/40.jpg')
      expect(images[1]['src']).to have_content('https://randomuser.me/api/portraits/men/92.jpg')
    end

    it 'shows the number of posts each user has written' do
      visit users_path
      posts_counter = page.all('.posts-counter')
      expect(posts_counter[0]).to have_content('Number of posts: 2')
      expect(posts_counter[1]).to have_content('Number of posts: 10')
    end

    it 'when I click on a user, I am redirected to that users show page' do
      visit users_path
      link = page.first('a')
      link.click
      expect(page).to have_current_path('/users/1')
    end
  end
end