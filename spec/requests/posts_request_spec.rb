require 'rails_helper'

describe 'Posts', type: :request do
  it 'renders the posts index' do
    get '/users/12/posts'
    expect(response).to have_http_status(200)
    expect(response).to render_template(:index)
    expect(response.body).to include('This is list of all posts')
  end

  it 'renders the posts show' do
    get '/users/12/posts/1'
    expect(response).to have_http_status(200)
    expect(response).to render_template(:show)
    expect(response.body).to include('This is a post')
  end
end
