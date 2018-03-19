class Bug < ApplicationRecord
    belongs_to :project
    validates :title, presence: true,
                      length: { maximum: 30 }
    validates :description, length: { maximum: 120 }
end
