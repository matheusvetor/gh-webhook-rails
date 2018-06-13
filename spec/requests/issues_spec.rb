# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Issue Resource', type: :request do
  let!(:issues)  { create_list(:issue, 10) }
  let(:issue_id) { issues.first.id }

  describe 'GET /repositories/:repository_id/issues' do
    let(:repository) { create(:repository) }
    before { create_list(:issue, 10, repository: repository)}
    before { get "/repositories/#{repository.id}/issues" }

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
    context 'when the request is valid' do
      before do
        headers = {
          :'Content-Type'   => 'application/json',
          :'X-GitHub-Event' => 'issues',
        }

        data = File.read(Rails.root.join('spec', 'fixtures', 'opened_issue.json'))

        post '/issues', headers: headers, params: data
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end
end
