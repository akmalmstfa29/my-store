require 'swagger_helper'

describe 'Stores API' do

    path '/api/v1/stores' do

        get 'Retrieves store list' do
            tags 'Stores'
            produces 'application/json', 'application/xml'

            response '200', 'store found' do
                schema type: :array,
                items: {
                    type: :object,
                    properties: {
                        id: { type: :integer },
                        name: { type: :string },
                        phone_number: { type: :string },
                        description: { type: :string },
                        created_at: { type: :string },
                        updated_at: { type: :string }
                    },
                },
                description: { type: :string }

                let(:id) { Blog.create(name: 'foo').id }
                run_test!
            end

            response '406', 'unsupported accept header' do
                let(:'Accept') { 'application/foo' }
                run_test!
            end
        end
    end

    path '/api/v1/stores' do

        post 'Create a store' do
            tags 'Stores'
            consumes 'application/json'
            parameter name: :store, in: :body, schema: {
                type: :object,
                properties: {
                    name: { type: :string },
                    phone_number: { type: :string },
                    description: { type: :string }
                },
                required: [ 'name', 'phone_number' ]
            }

            response '201', 'store created' do
                let(:store) { { name: 'foo' } }
                run_test!
            end

            response '422', 'invalid request' do
                let(:store) { { name: 'name is required' } }
                run_test!
            end
        end
    end

    path '/api/v1/stores/{id}' do

        patch 'Edit a store' do
            tags 'Stores'
            consumes 'application/json'
            parameter name: :id, in: :path, type: :integer
            parameter name: :store, in: :body, schema: {
                type: :object,
                properties: {
                    name: { type: :string },
                    phone_number: { type: :string },
                    description: { type: :string },
                    created_at: { type: :string },
                    updated_at: { type: :string }
                },
                required: [ 'name', 'phone_number' ]
            }

            response '201', 'store created' do
                let(:store) { { name: 'foo' } }
                run_test!
            end

            response '422', 'invalid request' do
                let(:store) { { name: 'name is required' } }
                run_test!
            end
        end
    end

    path '/api/v1/stores/{id}' do

        get 'Retrieves a store' do
            tags 'Stores'
            produces 'application/json', 'application/xml'
            parameter name: :id, in: :path, type: :integer

            response '200', 'store found' do
                schema type: :object,
                properties: {
                    id: { type: :integer },
                    name: { type: :string },
                    description: { type: :string },
                    created_at: { type: :string },
                    updated_at: { type: :string }
                },
                description: { type: :string }

                let(:id) { Blog.create(name: 'foo').id }
                run_test!
            end

            response '404', 'store not found' do
                let(:id) { 'invalid' }
                run_test!
            end

            response '406', 'unsupported accept header' do
                let(:'Accept') { 'application/foo' }
                run_test!
            end
        end
    end

    path '/api/v1/stores/{id}' do

        delete 'Delete a store' do
            tags 'Stores'
            consumes 'application/json'
            parameter name: :id, in: :path, type: :integer

            response '204', 'store deleted' do
                let(:store) { { name: 'foo' } }
                run_test!
            end

            response '422', 'invalid request' do
                let(:store) { { name: 'name is required' } }
                run_test!
            end
        end
    end
end
