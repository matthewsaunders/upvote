class Post < ApplicationRecord

  belongs_to :user
  has_many :comments

  validates_format_of :link, with: /\Ahttps?:\/\/w{3}?.?[^\.$.?#]*.[\a-zA-Z]*\z/

  MINUTES_IN_HOUR = 60
  MINUTES_IN_DAY  = MINUTES_IN_HOUR * 24

  def host
    uri = URI(link)

    if uri.host.blank?
      host = ""
    else
      host = uri.host

      # remove the preceding 'www'
      tokens = host.split('.')
      tokens.shift if tokens.first == "www"
      host = tokens.join('.')
    end

    host
  end

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
