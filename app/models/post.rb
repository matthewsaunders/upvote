class Post < ApplicationRecord

  belongs_to :user

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

end
