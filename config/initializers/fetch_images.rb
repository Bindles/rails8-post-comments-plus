require "httparty"

module GlobalImages
  def self.fetch_images
    url = "https://nick-bindles.imgbb.com/"
    response = HTTParty.get(url)

    # Extract image URLs using regex
    image_urls = response.body.scan(/<img[^>]+src="([^"]+)"/).flatten

    # Filter URLs that contain "https://i.ibb.co/"
    image_urls.select { |url| url.include?("https://i.ibb.co/") }
  rescue StandardError => e
    Rails.logger.error "Error fetching images: #{e.message}"
    []
  end

  def self.relevant_images
    @relevant_images ||= fetch_images
  end

  def self.names
    @names = [ "Alice", "Bob", "Charlie", "David", "Eve", "Frank", "Grace", "Henry", "Iris", "Jack", "Kate", "Leo", "Mia", "Nate", "Olivia", "Paul", "Quinn", "Rachel", "Sam", "Tara", "Ulysses", "Victoria", "Walter", "Xander", "Yvonne", "Zach", "Abby", "Ben", "Carla", "Daniel" ]
  end
end
