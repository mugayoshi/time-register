FactoryBot.define do
  factory :work_record do
    worked_on { "2019-12-07" }
    start_at { "2019-12-07 04:46:57" }
    end_at { "2019-12-07 04:46:57" }
    employee_id { nil }
    manager_id { nil }
    holiday { false }
    status { 1 }
  end
end
