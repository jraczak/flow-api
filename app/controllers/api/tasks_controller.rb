class Api::TasksController < ApplicationController
	before_action :set_task, only: [:show, :update, :destroy]
	before_action :doorkeeper_authorize!

	#before_action :authenticate_user!

	# GET /tasks
	def index
		@tasks = policy_scope(Task)
		json_response(@tasks)
	end

	# POST /tasks
	def create
		##@task = Task.new(task_params)
		##@task.user = current_user
		##@task.save!
		@task = current_user.tasks.create!(task_params)
		#puts params[:task]
		#@task = current_user.tasks.create!(params[:task])
		json_response(@task, :created)
	end

	# GET /tasks/:id
	def show
		puts current_user
		authorize @task
		json_response(@task)
	end

	# PUT /tasks/:id
	def update
		@task.update(task_params)
		# Just return the task anyway so we have access to fresh data
		json_response(@task)
	end

	# DELETE /tasks/:id
	def destroy
		@task.destroy
		head :no_content
	end

	private

	def task_params
		#whitelist params
		params.require(:task).permit(:name, :note, :current_scheduled_date, :original_scheduled_date, :migration_count, :complete)
	end

	def set_task
		@task = Task.find(params[:id])
	end
end
