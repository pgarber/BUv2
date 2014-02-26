class Project < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 5, maximum: 150 }
    belongs_to :company
end
