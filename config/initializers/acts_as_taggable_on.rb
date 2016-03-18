ActsAsTaggableOn::Tag.class_eval do
  ActsAsTaggableOn.delimiter = ', '
  ActsAsTaggableOn.force_lowercase = true
  ActsAsTaggableOn.remove_unused_tags = true

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
end