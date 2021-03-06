require 'acceptance_helper'

module V1
  describe 'Datasets Meta', type: :request do
    context 'Create and delete dataset' do
      fixtures :datasets

      let!(:dataset_id) { Dataset.first.id }

      let!(:params) {{"connector": {"id": "9b98340b-5f51-444a-bed7-2c5bf7a1894c",
                      "connector_url": "http://wri-01.carto.com/api/v2/sql?q=SELECT%20*%20FROM%20combined01_prepared%20where%20impactparameter=%27Food%20Demand%27 limit 1"
                    }}}

      let!(:tables_params) {{"connector": {
                             "id": "9b98340b-5f51-444a-bed7-2c5bf7a1894d",
                             "connector_url": "https://insights.cartodb.com/tables/cait_2_0_country_ghg_emissions_filtered/public/map"
                           }}}

      let!(:tables_params_u) {{"connector": {
                               "id": "9b98340b-5f51-444a-bed7-2c5bf7a18959",
                               "connector_url": "https://prep.carto.com/u/prep-admin/tables/temp_graph/table"
                             }}}

      let!(:params_failed) {{"connector": {"id": "9b98340b-5f51-444a-bed7-2c5bf7a1894c",
                             "connector_url": "https://rschumann.cartodb.com/api/v2/sql?q=select%20*%20fRom%20public.carts_test_endoin",
                             "attributes_path": "fields"
                            }}}

      it 'Allows access cartoDB data and save data attributes to db' do
        post "/datasets", params: params

        expect(status).to eq(201)
        expect(json_main['success']).to                                              eq(true)
        expect(Dataset.find('9b98340b-5f51-444a-bed7-2c5bf7a1894c').data_columns).to be_present
      end

      it 'Allows access cartoDB data on table endpoint and save data attributes to db' do
        post "/datasets", params: tables_params

        expect(status).to eq(201)
        expect(json_main['success']).to                                              eq(true)
        expect(Dataset.find('9b98340b-5f51-444a-bed7-2c5bf7a1894d').data_columns).to be_present
      end

      it 'Allows access cartoDB data on table endpoint with user and save data attributes to db' do
        post "/datasets", params: tables_params_u

        expect(status).to eq(201)
        expect(json_main['success']).to                                              eq(true)
        expect(Dataset.find('9b98340b-5f51-444a-bed7-2c5bf7a18959').data_columns).to be_present
      end

      it 'Allows update cartoDB data' do
        post "/datasets/#{dataset_id}", params: {"connector": {
                                                 "id": "#{dataset_id}",
                                                 "connector_url": "https://insights.cartodb.com/tables/cait_2_0_country_ghg_emissions_filtered/public/map",
                                                 "data_horizon": 3
                                                }}

        expect(status).to eq(200)
        expect(json_main['success']).to                  eq(true)
        expect(Dataset.find(dataset_id).data_columns).to be_present
        expect(Dataset.find(dataset_id).data_horizon).to eq(3)
      end

      it 'If dataset_url failed' do
        post "/datasets", params: params_failed

        expect(status).to eq(422)
        expect(json_main['success']).to                                      eq(false)
        expect(Dataset.where(id: '9b98340b-5f51-444a-bed7-2c5bf7a1894c')).to be_empty
      end

      it 'Allows to delete dataset' do
        delete "/datasets/#{dataset_id}"

        expect(status).to eq(200)
        expect(json_main['message']).to          eq('Dataset deleted')
        expect(Dataset.where(id: dataset_id)).to be_empty
      end
    end
  end
end
