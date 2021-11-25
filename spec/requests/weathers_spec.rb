require 'rails_helper'

RSpec.describe "Weathers", type: :request do

  describe "GET /weathers" do
    it "should return OK" do
      get '/weathers'
      payload = JSON.parse(response.body)
      expect(payload).to be_empty
      expect(response).to have_http_status(200)
    end

  describe 'Search when having values' do
    let!(:first_entry) { create(:weather)}
    let!(:second_entry) { create(:weather)}
    let!(:third_entry) { create(:weather)}
      
      it 'should retrive all weather values' do
        get '/weathers'
        payload = JSON.parse(response.body)
        expect(payload).not_to be_empty
        expect(payload.size).to eq(3)
        expect(response).to have_http_status(200)
      end

      it 'should retrive all weather matches' do

        get '/weathers?search=1985-01-01'
        payload = JSON.parse(response.body)
        expect(payload).not_to be_empty
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'with data in the DB' do
    let!(:weathers_list) { create_list(:weather, 10)} 

    before { get '/weathers'}

    it 'should return all the weathers created' do
        payload = JSON.parse(response.body)

        expect(payload.size).to eq(weathers_list.size)
        expect(payload.map { |unique_id| })
        expect(response).to have_http_status(200)
    end

  end


end
