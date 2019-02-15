class Event < ApplicationRecord
    belongs_to :creator, :class_name => "User"

    validates :name, presence: true,
                       length: { maximum: 50 }

    validates :location, presence: true,
                           length: { maximum: 50 }

    validates :description, presence: true,
                              length: { minimum: 10 }

    validates :date, presence: true

    validate :valid_date

    has_many :attendments
    has_many :attendees, :through => :attendments,
                          :source => :user

  private
    def valid_date
      if date && date < Time.zone.now
        errors.add(:date, "should be in future")
      end
    end
end
