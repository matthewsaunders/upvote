class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  MINUTES_IN_HOUR = 60
  MINUTES_IN_DAY  = MINUTES_IN_HOUR * 24

  def age
    now = Time.now
    minutes = ((now - created_at) / 1.minute).round

    if minutes < MINUTES_IN_HOUR
      time = minutes
      unit = "minute"
    elsif minutes < MINUTES_IN_DAY
      time = minutes / MINUTES_IN_HOUR
      unit = "hour"
    else
      time = minutes / MINUTES_IN_DAY
      unit = "day"
    end

    "#{time} #{unit.pluralize(time)} ago"
  end
end
