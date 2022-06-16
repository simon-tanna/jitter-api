class Message < ApplicationRecord
    validates_presence_of :text
    belongs_to :user

    def transform_message
        return {
            id: self.id,
            text: self.text,
            username: self.user.username,
            posted: self.updated_at
        }
    end
end
