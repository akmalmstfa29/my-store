require 'swagger_helper'

describe 'Products API' do

    path '/api/v1/products' do

        get 'Retrieves product list' do
            tags 'Products'
            produces 'application/json', 'application/xml'

            response '200', 'product found' do
                schema type: :array,
                items: {
                    type: :object,
                    properties: {
                        id: { type: :integer },
                        name: { type: :string },
                        price: { type: :integer },
                        store_id: { type: :integer },
                        store: {
                            type: :object,
                            properties: {
                                name: { type: :string },
                                phone_number: { type: :string },
                            }
                        },
                        labels: {
                            type: :array,
                            items: {
                                type: :object,
                                properties: {
                                    name: { type: :string },
                                }
                            }
                        },
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

    path '/api/v1/products' do

        post 'Create a product' do
            tags 'Products'
            consumes 'application/json'
            parameter name: :product, in: :body, schema: {
                type: :object,
                properties: {
                    name: { type: :string },
                    price: { type: :integer },
                    store_id: { type: :integer },
                    label_ids: {
                        type: :array,
                        items: {
                            type: :integer,
                        }
                    },
                    description: { type: :string }
                },
                required: [ 'name', 'price' ]
            }

            response '201', 'product created' do
                let(:product) { { name: 'foo' } }
                run_test!
            end

            response '422', 'invalid request' do
                let(:product) { { name: 'name is required' } }
                run_test!
            end
        end
    end

    path '/api/v1/products/{id}' do

        patch 'Edit a product' do
            tags 'Products'
            consumes 'application/json'
            parameter name: :id, in: :path, type: :integer
            parameter name: :product, in: :body, schema: {
                type: :object,
                properties: {
                    name: { type: :string },
                    price: { type: :integer },
                    store_id: { type: :integer },
                    label_ids: {
                        type: :array,
                        items: {
                            type: :integer,
                        }
                    },
                    description: { type: :string },
                    created_at: { type: :string },
                    updated_at: { type: :string }
                },
                required: [ 'name', 'price' ]
            }

            response '201', 'product created' do
                let(:product) { { name: 'foo' } }
                run_test!
            end

            response '422', 'invalid request' do
                let(:product) { { name: 'name is required' } }
                run_test!
            end
        end
    end

    path '/api/v1/products/{id}' do

        get 'Retrieves a product' do
            tags 'Products'
            produces 'application/json', 'application/xml'
            parameter name: :id, in: :path, type: :integer

            response '200', 'product found' do
                schema type: :object,
                properties: {
                    id: { type: :integer },
                    name: { type: :string },
                    store_id: { type: :integer },
                    store: {
                        type: :object,
                        properties: {
                            name: { type: :string },
                            phone_number: { type: :string },
                        }
                    },
                    labels: {
                        type: :array,
                        items: {
                            type: :object,
                            properties: {
                                name: { type: :string },
                            }
                        }
                    },
                    description: { type: :string },
                    created_at: { type: :string },
                    updated_at: { type: :string }
                },
                description: { type: :string }

                let(:id) { Blog.create(name: 'foo').id }
                run_test!
            end

            response '404', 'product not found' do
                let(:id) { 'invalid' }
                run_test!
            end

            response '406', 'unsupported accept header' do
                let(:'Accept') { 'application/foo' }
                run_test!
            end
        end
    end

    path '/api/v1/products/{id}' do

        delete 'Delete a product' do
            tags 'Products'
            consumes 'application/json'
            parameter name: :id, in: :path, type: :integer

            response '204', 'product deleted' do
                let(:product) { { name: 'foo' } }
                run_test!
            end

            response '422', 'invalid request' do
                let(:product) { { name: 'name is required' } }
                run_test!
            end
        end
    end
end
