module Attachments
  class Image < Attachment
    include Fields
    
    has_attached_file :archive, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :archive, content_type: /\Aimage\/.*\z/

    add_field :archive, type: :file
  end
end
