module ValidateTag
  extend ActiveSupport::Concern

  included do
    validate :validate_tag
  end

  def validate_tag
    tag_list.each do |tag|
      errors.add(:tag_list, "only allows these characters [ a-z, 0-9, - ]") unless tag =~ /\A[a-z0-9-]+\z/i
    end
  end
end