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

RSpec.describe '/programs', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Program. As you add validations to Program, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      program: 'Program A',
      kode_program: '1.01.06'
    }
  end

  let(:invalid_attributes) do
    {
      program: '',
      kode_program: ''
    }
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # ProgramsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    user = create(:user)
    sign_in user
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Program.create! valid_attributes
      get programs_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      program = Program.create! valid_attributes
      get program_url(program), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Program' do
        expect do
          post programs_url,
               params: { program: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Program, :count).by(1)
      end

      it 'renders a JSON response with the new program' do
        post programs_url,
             params: { program: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Program' do
        expect do
          post programs_url,
               params: { program: invalid_attributes }, as: :json
        end.to change(Program, :count).by(0)
      end

      it 'renders a JSON response with errors for the new program' do
        post programs_url,
             params: { program: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          program: 'new program'
        }
      end

      it 'updates the requested program' do
        program = Program.create! valid_attributes
        patch program_url(program),
              params: { program: new_attributes }, headers: valid_headers, as: :json
        program.reload
        update_res = JSON.parse(response.body).deep_symbolize_keys
        expect(program.program).to eq('new program')
        expect(update_res[:program]).to eq('new program')
      end

      it 'renders a JSON response with the program' do
        program = Program.create! valid_attributes
        patch program_url(program),
              params: { program: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the program' do
        program = Program.create! valid_attributes
        patch program_url(program),
              params: { program: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested program' do
      program = Program.create! valid_attributes
      expect do
        delete program_url(program), headers: valid_headers, as: :json
      end.to change(Program, :count).by(-1)
    end
  end
end
