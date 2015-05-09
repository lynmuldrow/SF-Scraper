namespace :scraper do
  desc "Scrape all San Francisco articles from Buzzfeed"
  task scrape_buzzfeed: :environment do
  	# 1. Go to http://www.buzzfeed.com/search?q=san+francisco
  	doc = Watir::Browser.new
  	doc.goto("http://www.buzzfeed.com/search?q=san+francisco")

  	# 2. Click on each link to each article
  	doc.links(class: 'trend').each do |a|
  		link = a.when_present

  		# 3. Instantiate new article and store title, permalink, subheading, posted_at
  		title = link.text

  		new_doc = Watir::Browser.new
  		new_doc.goto(link.href)

  		subheading = new_doc.p(class: 'description').text
  		permalink = link.href

  		Article.create(title: title, subheading: subheading, permalink: permalink)
  	end
  end
end