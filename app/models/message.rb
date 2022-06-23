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

    def self.find_by_user(username)
        # get the user object from the database
        user = User.find_by(username: username)
        # return the list of messages from a certain user
        return self.where(user: user)
    end
end
