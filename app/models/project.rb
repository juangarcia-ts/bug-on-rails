class Project < ApplicationRecord
    has_many :bugs    
    belongs_to :user    
    validates :name, presence: true
    validates :short_description, length: { maximum: 150 }, 
                                  presence: true
end
