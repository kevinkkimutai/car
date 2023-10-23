require 'swagger_helper'

RSpec.describe 'users', type: :request do

  path '/users/register' do

    post('create user') do
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

  path '/user/me' do

    get('show user') do
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

  path '/reset_password' do

    post('reset_password user') do
      response(200, 'successful') do
        consumes 'application/json'        
        parameter name: :users, in: :body, schema: {          
        type: :object,          
        properties: {            
         fullname: { type: :string},            
         email:{ type: :string },
         password_digest:{ type: :string }   

 },          
 required: %w[name model]  
}

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

  path '/update_password/{reset_password_token}' do
    # You'll want to customize the parameter types...
    parameter name: 'reset_password_token', in: :path, type: :string, description: 'reset_password_token'

    put('update_password user') do
      response(200, 'successful') do
        let(:reset_password_token) { '123' }

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

  path '/reset_password/{reset_password_token}' do
    # You'll want to customize the parameter types...
    parameter name: 'reset_password_token', in: :path, type: :string, description: 'reset_password_token'

    put('update_password user') do
      response(200, 'successful') do
        let(:reset_password_token) { '123' }

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
