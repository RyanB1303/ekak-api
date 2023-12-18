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

RSpec.describe '/api/v1/tahuns', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Tahun. As you add validations to Tahun, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    periode = create(:periode)
    {
      tahun: 2025,
      kelompok_anggaran: 'Murni',
      keterangan: 'test',
      periode_id: periode.id
    }
  end

  let(:invalid_attributes) do
    {
      tahun: '',
      kelompok_anggaran: 'Murni',
      keterangan: 'test',
      periode_id: ''
    }
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # TahunsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    user = create(:user)
    sign_in user
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Tahun.create! valid_attributes
      get api_v1_tahuns_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      tahun = Tahun.create! valid_attributes
      get api_v1_tahun_url(tahun), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Tahun' do
        expect do
          post api_v1_tahuns_url,
               params: { tahun: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Tahun, :count).by(1)
      end

      it 'renders a JSON response with the new tahun' do
        post api_v1_tahuns_url,
             params: { tahun: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Tahun' do
        expect do
          post api_v1_tahuns_url,
               params: { tahun: invalid_attributes }, as: :json
        end.to change(Tahun, :count).by(0)
      end

      it 'renders a JSON response with errors for the new tahun' do
        post api_v1_tahuns_url,
             params: { tahun: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          tahun: 2030,
          keterangan: 'Test Ganti'
        }
      end

      it 'updates the requested tahun' do
        tahun = Tahun.create! valid_attributes
        patch api_v1_tahun_url(tahun),
              params: { tahun: new_attributes }, headers: valid_headers, as: :json
        tahun.reload
        update_response = JSON.parse(response.body).deep_symbolize_keys
        expect(tahun.tahun).to eq(2030)
        expect(update_response [:tahun]).to eq(2030)
      end

      it 'renders a JSON response with the tahun' do
        tahun = Tahun.create! valid_attributes
        patch api_v1_tahun_url(tahun),
              params: { tahun: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the tahun' do
        tahun = Tahun.create! valid_attributes
        patch api_v1_tahun_url(tahun),
              params: { tahun: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested tahun' do
      tahun = Tahun.create! valid_attributes
      expect do
        delete api_v1_tahun_url(tahun), headers: valid_headers, as: :json
      end.to change(Tahun, :count).by(-1)
    end
  end
end