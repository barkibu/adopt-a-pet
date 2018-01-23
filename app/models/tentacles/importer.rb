require 'json'
require 'aws-sdk-s3'

class Tentacles::Importer
  def run(feed)
    if Rails.env.production? || Rails.env.staging?
      data = get_json_from_s3 feed[:name]
    else
      data = get_json_from_local feed[:name]
    end
    return unless data

    data.each do |object|
      save_object object
    end
    true
  end

  def save_object(object)
    pet_factory = Tentacles::PetFactory.new(object)
    pet_factory.update
  end

  def get_json_from_local(name)
    return unless File.exist? file_name(name)

    json_file = File.new file_name(name), 'r'
    raw_content = json_file.read
    content_parsed = JSON.parse(raw_content)
  end

  def get_json_from_s3(name)
    s3 = Aws::S3::Resource.new
    resp = s3.bucket(ENV['S3_BUCKET_NAME']).object("tentacles/data/#{name}.json")
    raw_content = resp.read
    content_parsed = JSON.parse(raw_content)
  end

  def file_name(name)
    "db/tentacles/data/#{name}.json"
  end
end
