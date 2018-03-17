class Project < ApplicationRecord
    has_many :bugs    
    belongs_to :user    
    validates :name, presence: true
    validates :short_description, length: { maximum: 120 }, 
                                  presence: true
end
