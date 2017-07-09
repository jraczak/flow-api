class TaskPolicy < ApplicationPolicy
	
    def initialize(user, task)
		@user = user
		@task = task
	end

	attr_reader :user, :task
	
	class Scope < Scope

	attr_reader :user, :scope

	def initialize(user, scope)
		@user = user
		@scope = scope
	end

	def resolve
		scope.where(user_id: user.id)
	end
end

	def show?
		puts task
		task.user_id == user.id
	end
end
