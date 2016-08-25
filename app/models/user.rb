class User < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :attractions, through: :rides

  has_secure_password

  validates :password, presence: true, on: :create


  def mood
    mood_rating = self.happiness <=> self.nausea
    case mood_rating
    when -1
      'sad'
    when 0

    when 1
      'happy'
    end
  end
end
