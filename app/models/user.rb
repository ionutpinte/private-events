class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true,
                       length: { maximum: 50 }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

    validates :email, presence: true,
                        length: { maximum: 255 },
                        format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}

    validates :password, presence: true,
                           length: { minimum: 6 },
                        allow_nil: true

    has_many :created_events, :foreign_key => "creator_id",
                              :class_name => "Event",
                              dependent: :destroy

    has_many :attendments
    has_many :attended_events, :through => :attendments,
                               :source => :event

end
