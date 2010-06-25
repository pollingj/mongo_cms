class Page
  include MongoMapper::Document
  
  key :title, String, :required => true
  key :slug, String, :required => true
end
