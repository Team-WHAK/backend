class Task < ApplicationRecord
    belongs_to :user
    validates :area, :item, :picture, :task_name, :task_descr, :frequency, :due_date, presence: true
end
