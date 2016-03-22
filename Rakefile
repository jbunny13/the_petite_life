# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

namespace :paperclip_assets do
  desc "Migrate S3 images to new filenames"
  task :migrate_images => :environment do
    s3 = AWS::S3.new(access_key_id: ENV["S3_ACCESS_KEY_ID"], secret_access_key: ENV["S3_SECRET_ACCESS_KEY"])

    bucket = s3.buckets[ENV["S3_BUCKET"]]

    bucket.objects.each do |object|
      next unless object.key =~ /\.(jpg|jpeg|png|gif)$/

      path_parts = object.key.split("/")

      # Assumes that old interpolation pattern was
      # `/:class/:attachment/:id_partition/:style/:filename`
      resource_id         = path_parts[2..4].join.to_i
      resource_class_name = path_parts[0].singularize.classify
      attachment_name     = path_parts[1].singularize

      begin
        resource_class = resource_class_name.constantize
        resource       = resource_class.find(resource_id)

        new_path = resource.send(attachment_name).path

        Rails.logger.info "Renaming: #{object.key} -> #{new_path}"

        object.copy_to new_path, acl: :public_read
      rescue => e
        Rails.logger.error "Error renaming #{object.key}: #{e.inspect}"
      end
    end
  end
end