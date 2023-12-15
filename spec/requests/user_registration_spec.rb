require 'rails_helper'

RSpec.describe '/users', type: :request do
  let(:valid_attributes) do
    # skip("Add a hash of attributes valid for your model")
    {
      nip: '123456789012345678',
      email: 'test@test.com',
      password: 'password',
      password_confirmation: 'password'
    }
  end

  let(:invalid_attributes) do
    # skip("Add a hash of attributes invalid for your model")
    {
      nip: '',
      email: '',
      password: 'password',
      password_confirmation: 'password'
    }
  end

  describe 'POST /users' do
    context 'with valid parameters' do
      it 'creates a new User' do
        expect do
          post user_registration_path,
               params: { user: valid_attributes }, as: :json
        end.to change(User, :count).by(1)
      end

      it 'renders a JSON response with the new user' do
        post user_registration_path,
             params: { user: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new User' do
        expect do
          post user_registration_path,
               params: { user: invalid_attributes }, as: :json
        end.to change(User, :count).by(0)
      end

      it 'renders a JSON response with errors for the new user' do
        post user_registration_path,
             params: { user: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end
end
