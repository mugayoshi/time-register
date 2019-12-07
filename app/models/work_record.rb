class WorkRecord < ApplicationRecord
  belongs_to :employee_id
  belongs_to :manager_id
end
