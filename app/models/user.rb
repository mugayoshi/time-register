class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, confirmation: true
  has_secure_password
  
  has_many :work_records
  
  def get_department()
    if self.department_id
      return Department.find(self.department_id)
    else
      return Department.find(1)
    end
  end
  
  def get_manager()
    if self.manager_id
      return User.find(self.manager_id)
    else
      # if the user themself is manager, display their own name in the page
      return self
    end
  end
  
  def manager?
    if self.manager_flag
      return true
    else
      return false
    end
  end
end
