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

RSpec.describe '/api/v1/strategics', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Strategic. As you add validations to Strategic, be sure to
  # adjust the attributes here as well.
  let(:tahun) { create(:tahun, tahun: 2025) }
  let(:opd) { create(:opd) }
  let(:role) { create(:role) }

  # TODO: test parent child request
  let(:valid_attributes) do
    {
      strategi: 'contoh a',
      keterangan: 'test',
      from_kota: false,
      opd_id: opd.id,
      tahun_id: tahun.id,
      role_id: role.id
    }
  end

  let(:invalid_attributes) do
    {
      strategi: ''
    }
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # StrategicsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:user) { create(:user) }

  let(:valid_headers) do
    sign_in user
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Strategic.create! valid_attributes
      get api_v1_strategics_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      strategic = Strategic.create! valid_attributes
      get api_v1_strategic_url(strategic), headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Strategic' do
        expect do
          post api_v1_strategics_url,
               params: { strategic: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Strategic, :count).by(1)
      end

      it 'renders a JSON response with the new strategic' do
        post api_v1_strategics_url,
             params: { strategic: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Strategic' do
        expect do
          post api_v1_strategics_url,
               params: { strategic: invalid_attributes }, as: :json
        end.to change(Strategic, :count).by(0)
      end

      it 'renders a JSON response with errors for the new strategic' do
        post api_v1_strategics_url,
             params: { strategic: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_opd) { create(:opd, nama_opd: 'opd 2', kode_opd: 'opd_2', lembaga: opd.lembaga) }
      let(:new_attributes) do
        {
          strategi: 'update',
          opd_id: new_opd.id
        }
      end

      it 'updates the requested strategic with change opd' do
        strategic = Strategic.create! valid_attributes
        patch api_v1_strategic_url(strategic),
              params: { strategic: new_attributes }, headers: valid_headers, as: :json
        strategic.reload
        update_res = JSON.parse(response.body).deep_symbolize_keys
        expect(strategic.opd).to eq new_opd
        expect(update_res[:strategi]).to eq 'update'
      end

      it 'renders a JSON response with the strategic' do
        strategic = Strategic.create! valid_attributes
        patch api_v1_strategic_url(strategic),
              params: { strategic: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the strategic' do
        strategic = Strategic.create! valid_attributes
        patch api_v1_strategic_url(strategic),
              params: { strategic: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested strategic' do
      strategic = Strategic.create! valid_attributes
      expect do
        delete api_v1_strategic_url(strategic), headers: valid_headers, as: :json
      end.to change(Strategic, :count).by(-1)
    end
  end
end
