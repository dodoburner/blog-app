require 'rails_helper'

describe 'Users', type: :request do
  it 'renders the users index' do
    get '/users'
    expect(response).to have_http_status(200)
    expect(response).to render_template(:index)
    expect(response.body).to include('List of all users: ')
  end

  it 'renders the users show' do
    get '/users/12'
    expect(response).to have_http_status(200)
    expect(response).to render_template(:show)
    expect(response.body).to include('This is the user page')
  end
end
