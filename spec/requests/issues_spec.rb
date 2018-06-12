# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Issue Resource', type: :request do
  let!(:issues)  { create_list(:issue, 10) }
  let(:issue_id) { issues.first.id }

  describe 'GET /repositories/:repository_id/issues' do
    let(:repository_key) { { repository_id: 9999, repository_name: 'some_name'} }
    before { create_list(:issue, 10, repository_key)}
    before { get "/repositories/#{repository_key[:repository_id]}/issues" }

    it "returns repository's issues" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    describe 'with invalid repository id' do
      before { get "/repositories/10000/issues" }

      it 'returns authors' do
        expect(json).to be_empty
      end
    end
  end

  describe 'GET /issues/:id' do
    before { get "/issues/#{issue_id}" }

    context 'when the record exists' do
      it 'returns the issue' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(issue_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:issue_id) { 100000 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Record Not Found/)
      end
    end
  end

  describe 'POST /issues' do
    let(:valid_attributes) { attributes_for(:issue) }

    context 'when the request is valid' do
      before { post '/issues', params: { issue: valid_attributes } }

      it 'creates a issue' do
        expect(json['repository_name']).to eq(valid_attributes[:repository_name])
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/issues', params: { issue: { repository_name: nil } } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to eq("[\"Repository can't be blank\",\"Repository name can't be blank\",\"Owner name can't be blank\"]")
      end
    end
  end
end
