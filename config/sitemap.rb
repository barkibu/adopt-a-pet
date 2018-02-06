require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://www.barkiadopta.org'
SitemapGenerator::Sitemap.create do
  add '/', changefreq: 'weekly'

  %w[mascotas perros gatos].each do |pet|
    add "/en-adopcion/#{pet}/", changefreq: 'weekly'
    Province.all.each do |province|
      add "/en-adopcion/#{pet}/#{province.slug}/", changefreq: 'weekly'
    end
  end
  add '/protectoras-de-animales', changefreq: 'monthly'
end
# SitemapGenerator::Sitemap.ping_search_engines # Not needed if you use the rake tasks
