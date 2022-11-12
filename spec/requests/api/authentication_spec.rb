require 'swagger_helper'

RSpec.describe 'api/authentication', type: :request do

  path '/api/auth' do

    post('create authentication') do
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
