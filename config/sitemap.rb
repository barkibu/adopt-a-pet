require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://www.barkiadopta.org'
SitemapGenerator::Sitemap.create do
  add '/', changefreq: 'weekly'
  Province.all.each do |province|
    add '/en-adopcion/mascotas/', changefreq: 'weekly'
    add "/en-adopcion/mascotas/#{province.slug}/", changefreq: 'weekly'
    add '/en-adopcion/perros/', changefreq: 'weekly'
    add "/en-adopcion/perros/#{province.slug}/", changefreq: 'weekly'
    add '/en-adopcion/gatos/', changefreq: 'weekly'
    add "/en-adopcion/gatos/#{province.slug}/", changefreq: 'weekly'
    add '/protectoras-de-animales', changefreq: 'monthly'
  end
end
# SitemapGenerator::Sitemap.ping_search_engines # Not needed if you use the rake tasks
