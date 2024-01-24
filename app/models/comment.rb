class Comment < ApplicationRecord
    validates :author, presence: true
end
