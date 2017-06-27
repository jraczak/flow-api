require 'rails_helper'

RSpec.describe 'Taks API', type: :request do
	let!(:tasks) {create_list(:task, 10) }
	let(:task_id) { tasks.first.id }

	 #Test suite for GET /tasks
	describe 'GET /tasks' do
		# make HTTP get request before each example
		before { get '/tasks' }

		it 'returns tasks' do
			# Note json is a custom helper to parse JSON responses
			expect(json).not_to be_empty
			expect(json.size).to eq(10)
		end

		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end
	end

	# Test suite for GET /tasks/:id
	describe 'GET /tasks/:id' do
		before { get "/tasks/#{task_id}" }

		context 'when the record exists' do
			it 'returns the task' do
				expect(json).not_to be_empty
				expect(json['id']).to eq(task_id)
			end

			it 'returns the status code 200' do
				expect(response).to have_http_status(200)
			end
		end

		context 'when the record does not exist' do
			let(:task_id) { 100 }

			it 'returns the status code 404' do
				expect(response).to have_http_status(400)
			end

			it 'returns a not found message' do
				expect(response.body).to match(/Couldn't find Task with 'id'=#{task_id}/)
			end
		end
	end

	# Test suite for POST /tasks
	describe 'POST /tasks' do
		let(:valid_attributes) { { user_id: 'sdfhj2347892k', local_realm_id: 1, name: 'Walk the dog', 
			note: 'A note about walking the dog', original_scheduled_date: '05/27/2017', 
			current_scheduled_date: '08/27/2017', migration_count: 5, complete: false } }

			context 'when the request is valid' do
				before { post '/tasks', params: valid_attributes }

				it 'creates a task' do
					expect(json['name']).to eq('Walk the dog')
				end

				it 'returns status code 201' do
					expect(response).to have_http_status(201)
				end
			end

			context 'when the request is invalid' do
				before { post '/tasks', params: { name: 'FooBar' } }

				it 'returns status code 422' do
					expect(response).to have_http_status(422)
				end

				it 'returns a validation failure message' do
					expect(response.body)
					.to match(/Validation failed: user_id can't be blank/)
				end
			end
		end

	# Test suite for PUT /tasks/:id
	describe 'PUT /tasks/:id' do
		let(:valid_attributes) { { name: 'Play with the dog' } }

		context 'when the record exists' do
			before { put "/tasks/#{task_id}", params: valid_attributes }

			it 'updates the record' do
				expect(response.body).to be_empty
			end

			it 'returns status code 204' do
				expect(response).to have_http_status(204)
			end
		end
	end

	# Test suite for DELETE /tasks/:id
	describe 'DELETE /tasks/:id' do
		before { delete "/tasks/#{task_id}" }

		it 'returns status code 204' do
			expect(response).to have_http_status(204)
		end
	end
end