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

RSpec.describe '/api/v1/opds', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Opd. As you add validations to Opd, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    lembaga = create(:lembaga)
    {
      nama_opd: 'Test OPD',
      kode_opd: 'xxx',
      lembaga_id: lembaga.id
    }
  end

  let(:invalid_attributes) do
    {
      nama_opd: '',
      kode_opd: '',
      lembaga_id: ''
    }
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # OpdsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    user = create(:user)
    sign_in user
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Opd.create! valid_attributes
      get api_v1_opds_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      opd = Opd.create! valid_attributes
      get api_v1_opd_url(opd), headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Opd' do
        expect do
          post api_v1_opds_url,
               params: { opd: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Opd, :count).by(1)
      end

      it 'renders a JSON response with the new opd' do
        post api_v1_opds_url,
             params: { opd: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Opd' do
        expect do
          post api_v1_opds_url,
               params: { opd: invalid_attributes }, as: :json
        end.to change(Opd, :count).by(0)
      end

      it 'renders a JSON response with errors for the new opd' do
        post api_v1_opds_url,
             params: { opd: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          nama_opd: 'update_opd'
        }
      end

      it 'updates the requested opd' do
        opd = Opd.create! valid_attributes
        patch api_v1_opd_url(opd),
              params: { opd: new_attributes }, headers: valid_headers, as: :json
        opd.reload
        expect(opd.nama_opd).to eq('update_opd')
        update_response = JSON.parse(response.body).deep_symbolize_keys
        expect(update_response[:nama_opd]).to eq(new_attributes[:nama_opd])
      end

      it 'renders a JSON response with the opd' do
        opd = Opd.create! valid_attributes
        patch api_v1_opd_url(opd),
              params: { opd: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the opd' do
        opd = Opd.create! valid_attributes
        patch api_v1_opd_url(opd),
              params: { opd: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested opd' do
      opd = Opd.create! valid_attributes
      expect do
        delete api_v1_opd_url(opd), headers: valid_headers, as: :json
      end.to change(Opd, :count).by(-1)
    end
  end
end
