# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = ENV["HOST"] || "https://la-boite-a.pouly.eu"

SitemapGenerator::Sitemap.create do
  Person.find_each do |person|
    add show_by_nickname_path(person.nickname), lastmod: person.quotes.order(:updated_at).last.updated_at
  end
end
