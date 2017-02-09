class Post < ApplicationRecord

  belongs_to :user
  has_many :comments

  validates_format_of :link, with: /\Ahttps?:\/\/w{3}?.?[^\.$.?#]*.[\a-zA-Z]*\z/

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
    hours = ((now - created_at) / 1.hour).round

    if hours < 24
      time = hours
      unit = "hour".pluralize(time)
    else
      time = hours / 24
      unit = "day".pluralize(time)
    end

    "#{time} #{unit} ago"
  end

end
