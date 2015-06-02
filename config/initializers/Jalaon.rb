if Rails.env == "production"
  ASSET_STORAGE = :fog
  # SITEMAP_ADAPTER = SitemapGenerator::S3Adapter.new(fog_directory: "jalaon")
else
  ASSET_STORAGE = :file
  # SITEMAP_ADAPTER = SitemapGenerator::FileAdapter.new
end
