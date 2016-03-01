class User < ActiveRecord::Base

	has_secure_password

	has_one :profile, dependent: :destroy
	has_many :todo_lists, dependent: :destroy
	has_many :todo_items, through: :todo_lists, source: :todo_items, dependent: :destroy

	validates :username, presence: true

	def get_completed_count
		return todo_items.select{ |item| item.completed}.size
	end
end
