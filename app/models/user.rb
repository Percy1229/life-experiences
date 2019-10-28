class User < ApplicationRecord
    before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 25 } 
    validates :email, presence: true, length: { maximum: 255 }, 
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
    uniqueness: { case_sensitive: false }
    validates :introduce, length: { maximum: 255 }
    
    has_secure_password

    
    has_many :experiences
    has_many :relationships 
    has_many :likes, through: :relationships, source: :favorite
    has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'favorite_id'
    has_many :liked, through: :reverses_of_relationship, source: :user
    
    def favorite(other_user)
        unless self == other_user
        self.relationships.find_or_create_by(favorite_id: other_user.id)
        end
    end
    
    def unfavorite(other_user)
        relationship = self.relationships.find_by(favorite_id: other_user.id)
        relationship.destroy if relationship
    end
    
    def like?(other_user)
        self.likes.include?(other_user)
    end
end
