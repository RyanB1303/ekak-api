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

RSpec.describe '/api/v1/lembagas', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Lembaga. As you add validations to Lembaga, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    # skip("Add a hash of attributes valid for your model")
    {
      nama_lembaga: 'Lembaga A',
      kode_lembaga: '01'
    }
  end

  let(:invalid_attributes) do
    # skip("Add a hash of attributes invalid for your model")
    {
      nama_lembaga: '',
      kode_lembaga: ''
    }
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # LembagasController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    # user = User.create(nip: '123456789012345678', email: 'user@test.com', password: '123456')
    user = create(:user)
    sign_in user
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Lembaga.create! valid_attributes
      get api_v1_lembagas_path, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      lembaga = Lembaga.create! valid_attributes
      get api_v1_lembaga_path(lembaga), headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Lembaga' do
        expect do
          post api_v1_lembagas_path,
               params: { lembaga: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Lembaga, :count).by(1)
      end

      it 'renders a JSON response with the new lembaga' do
        post api_v1_lembagas_path,
             params: { lembaga: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Lembaga' do
        expect do
          post api_v1_lembagas_path,
               params: { lembaga: invalid_attributes }, as: :json
        end.to change(Lembaga, :count).by(0)
      end

      it 'renders a JSON response with errors for the new lembaga' do
        post api_v1_lembagas_path,
             params: { lembaga: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          nama_lembaga: 'Update lembaga'
        }
      end

      it 'updates the requested lembaga' do
        lembaga = Lembaga.create! valid_attributes
        patch api_v1_lembaga_url(lembaga),
              params: { lembaga: new_attributes }, headers: valid_headers, as: :json
        lembaga.reload
        update_response = JSON.parse(response.body).deep_symbolize_keys
        expect(update_response[:nama_lembaga]).to eq(new_attributes[:nama_lembaga])
      end

      it 'renders a JSON response with the lembaga' do
        lembaga = Lembaga.create! valid_attributes
        patch api_v1_lembaga_url(lembaga),
              params: { lembaga: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the lembaga' do
        lembaga = Lembaga.create! valid_attributes
        patch api_v1_lembaga_url(lembaga),
              params: { lembaga: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested lembaga' do
      lembaga = Lembaga.create! valid_attributes
      expect do
        delete api_v1_lembaga_url(lembaga), headers: valid_headers, as: :json
      end.to change(Lembaga, :count).by(-1)
    end
  end
end
