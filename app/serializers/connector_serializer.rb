# frozen_string_literal: true
class ConnectorSerializer < ApplicationSerializer
  attributes :clone_url, :data

  def clone_url
    data = {}
    data['http_method'] = 'POST'
    data['url']         = "#{URI.parse(clone_uri)}"
    data['body']        = body_params
    data
  end

  def data
    @data
  end

  def uri
    "#{@uri['full_path']}"
  end

  def clone_uri
    "/dataset/#{object.id}/clone"
  end

  def body_params
    {
      "dataset" => {
        "dataset_url" => "#{URI.parse(uri)}",
        "application" => ["your","apps"]
      }
    }
  end

  def initialize(object, options)
    super
    @query_filter = options[:query_filter]
    @uri          = options[:uri]
    @data         = options[:data]
  end
end
