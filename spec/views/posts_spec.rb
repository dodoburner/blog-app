require 'rails_helper'
RSpec.describe 'Post view', type: :system do
  before(:all) do
    @lilly = User.create( name: "Lilly",
      photo: "https://randomuser.me/api/portraits/women/40.jpg",
      bio: "Teacher from Poland.",)
    @first_post = Post.create(author: @lilly, title: 'new post', text: 'I love posting')
    Comment.create(author: @lilly, post: @first_post, text: 'I love comments')
    Post.create(author: @lilly, title: 'second post', text: 'yeahhh')
    Post.create(author: @lilly, title: 'third post', text: 'uuuu')
    Post.create(author: @lilly, title: 'fourth post', text: 'eee')
  end
  
  describe 'post index page' do
    it 'shows the users profile picture' do
      visit '/users/1/posts'
      img = page.find('img')
      expect(img['src']).to have_content('https://randomuser.me/api/portraits/women/40.jpg')
    end

    it 'shows the users username' do
      visit '/users/1/posts'
      username = page.find('.user-name')
      expect(username).to have_content('Lilly')
    end

    it 'shows the users posts counter' do
      visit '/users/1/posts'
      posts_counter = page.find('.posts-counter')
      expect(posts_counter).to have_content('Number of posts: 4')
    end

    it 'shows the title of a post' do
      visit '/users/1/posts'
      post = page.first('.post')
      expect(post).to have_content('new post')
    end

    it 'shows the body of a post' do
      visit '/users/1/posts'
      post = page.first('.post')
      expect(post).to have_content('I love posting')
    end
    
    it 'shows the first comment of a post' do
      visit '/users/1/posts'
      comments = page.first('.comments')
      expect(comments).to have_content('I love comments')
    end

    it 'shows how many comments a post has' do
      visit '/users/1/posts'
      post = page.first('.post')
      expect(post).to have_content('Comments: 1')
    end

    it 'shows how many comments a post has' do
      visit '/users/1/posts'
      post = page.first('.post')
      expect(post).to have_content('Comments: 1')
    end

    it 'shows how many likes a post has' do
      visit '/users/1/posts'
      post = page.first('.post')
      expect(post).to have_content('Likes: 0')
    end

    it 'redirects me to the post show page when clicking on a post' do
      visit '/users/1/posts'
      post = page.first('.post')
      post.click
      expect(page).to have_current_path('/users/1/posts/1')
    end
  end

  describe 'post show page' do
    it 'shows the posts title' do
      visit '/users/1/posts/1'
      expect(page).to have_content('new post')
    end

    it 'shows the posts author' do
      visit '/users/1/posts/1'
      expect(page).to have_content('Lilly')
    end

    it 'shows the number of comments' do
      visit '/users/1/posts/1'
      expect(page).to have_content('Comments: 1')
    end

    it 'shows the number of likes' do
      visit '/users/1/posts/1'
      expect(page).to have_content('Likes: 0')
    end

    it 'shows the post body' do
      visit '/users/1/posts/1'
      expect(page).to have_content('I love posting')
    end

    it 'shows the username of each commentator' do
      visit '/users/1/posts/1'
      comments = page.find('.comments')
      expect(comments).to have_content('Lilly')
    end

    it 'shows the comment of each commentator' do
      visit '/users/1/posts/1'
      comments = page.find('.comments')
      expect(comments).to have_content('I love comments')
    end
  end
end