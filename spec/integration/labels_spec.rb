require 'swagger_helper'

describe 'Labels API' do

    path '/api/v1/labels' do

        get 'Retrieves label list' do
            tags 'Labels'
            produces 'application/json', 'application/xml'

            response '200', 'label found' do
                schema type: :array,
                items: {
                    type: :object,
                    properties: {
                        id: { type: :integer },
                        name: { type: :string },
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

    path '/api/v1/labels' do

        post 'Create a label' do
            tags 'Labels'
            consumes 'application/json'
            parameter name: :label, in: :body, schema: {
            type: :object,
            properties: {
                name: { type: :string },
                description: { type: :string }
            },
                required: [ 'name' ]
            }

            response '201', 'label created' do
                let(:label) { { name: 'foo' } }
                run_test!
            end

            response '422', 'invalid request' do
                let(:label) { { name: 'name is required' } }
                run_test!
            end
        end
    end

    path '/api/v1/labels/{id}' do

        patch 'Edit a label' do
            tags 'Labels'
            consumes 'application/json'
            parameter name: :id, in: :path, type: :integer
            parameter name: :label, in: :body, schema: {
                type: :object,
                properties: {
                    name: { type: :string },
                    description: { type: :string }
                },
                required: [ 'name' ]
            }

            response '201', 'label created' do
                let(:label) { { name: 'foo' } }
                run_test!
            end

            response '422', 'invalid request' do
                let(:label) { { name: 'name is required' } }
                run_test!
            end
        end
    end

    path '/api/v1/labels/{id}' do

        get 'Retrieves a label' do
            tags 'Labels'
            produces 'application/json', 'application/xml'
            parameter name: :id, in: :path, type: :integer

            response '200', 'label found' do
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

            response '404', 'label not found' do
                let(:id) { 'invalid' }
                run_test!
            end

            response '406', 'unsupported accept header' do
                let(:'Accept') { 'application/foo' }
                run_test!
            end
        end
    end

    path '/api/v1/labels/{id}' do

        delete 'Delete a label' do
            tags 'Labels'
            consumes 'application/json'
            parameter name: :id, in: :path, type: :integer

            response '204', 'label deleted' do
                let(:label) { { name: 'foo' } }
                run_test!
            end

            response '422', 'invalid request' do
                let(:label) { { name: 'name is required' } }
                run_test!
            end
        end
    end
end
