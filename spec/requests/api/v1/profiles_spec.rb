require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/api/v1/profiles', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Profile. As you add validations to Profile, be sure to
  # adjust the attributes here as well.
  let(:user) { create(:user) }
  let(:opd) { create(:opd) }

  let(:valid_attributes) do
    {
      nama: 'User A',
      nip: user.nip,
      opd_id: opd.id
    }
  end

  let(:invalid_attributes) do
    {
      nama: '',
      nip: ''
    }
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # ProfilesController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    sign_in user
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Profile.create! valid_attributes
      get api_v1_profiles_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      profile = Profile.create! valid_attributes
      get api_v1_profile_url(profile.nip), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Profile' do
        expect do
          post api_v1_profiles_url,
               params: { profile: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Profile, :count).by(1)
      end

      it 'renders a JSON response with the new profile' do
        post api_v1_profiles_url,
             params: { profile: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Profile' do
        expect do
          post api_v1_profiles_url,
               params: { profile: invalid_attributes }, as: :json
        end.to change(Profile, :count).by(0)
      end

      it 'renders a JSON response with errors for the new profile' do
        post api_v1_profiles_url,
             params: { profile: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          nama: 'update-nama'
        }
      end

      it 'updates the requested profile' do
        profile = Profile.create! valid_attributes
        patch api_v1_profile_url(profile.nip),
              params: { profile: new_attributes }, headers: valid_headers, as: :json
        profile.reload
        update_res = JSON.parse(response.body).deep_symbolize_keys
        expect(update_res[:nama]).to eq('update-nama')
        expect(profile.nama).to eq('update-nama')
      end

      it 'renders a JSON response with the profile' do
        profile = Profile.create! valid_attributes
        patch api_v1_profile_url(profile.nip),
              params: { profile: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the profile' do
        profile = Profile.create! valid_attributes
        patch api_v1_profile_url(profile.nip),
              params: { profile: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested profile' do
      profile = Profile.create! valid_attributes
      expect do
        delete api_v1_profile_url(profile.nip), headers: valid_headers, as: :json
      end.to change(Profile, :count).by(-1)
    end
  end
end
