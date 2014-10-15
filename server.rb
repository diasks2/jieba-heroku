# -*- encoding : utf-8 -*- #

require 'jieba'
require 'json'

post "/?" do
  return 403 unless params[:key] == ENV['KEY']
  text = params[:text]
  segmented_text = text.to_tags.to_s
  segmented_text.force_encoding("utf-8")#.scan(/\[([^\]]*)\]/).flatten.to_json
end
