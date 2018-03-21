class Project < ApplicationRecord
    has_many :bugs    
    belongs_to :user    
    validates :name, presence: true,
                     length: { maximum: 30 }
    validates :short_description, length: { maximum: 150 }, 
                                  presence: true
end
