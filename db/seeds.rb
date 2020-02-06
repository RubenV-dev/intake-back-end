# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# user1 = User.create(username:"Ruben", password_digest: "password")
# food1= Food.create(name:"Blueberry", calories:"200", fat:"22", carbs:"22", protein:"22")
# foodentry1=FoodEntry.create(food: food1, user: user1)

require "uri"
require "net/http"

tokurl = URI("https://oauth.fatsecret.com/connect/token")

tokhttps = Net::HTTP.new(tokurl.host, tokurl.port);
tokhttps.use_ssl = true
request = Net::HTTP::Post.new(tokurl)
request["Content-Type"] = "application/json"
request["Authorization"] = "Basic #{ENV["CLIENTAUTH"]}"
form_data = [['grant_type', 'client_credentials'],[' scope', '\'basic\'']]
request.set_form form_data, 'multipart/form-data'
response = tokhttps.request(request)
parsedKey = JSON.parse response.read_body.gsub('=>', ':')
token = parsedKey["access_token"]

def responseParser(response)
    parsedData = JSON.parse response.gsub('=>', ':')
    foodArray = parsedData["foods"]["food"]
end

def createFoods(response)
    responseParser(response).each do |respObj|
        descriptionExtractor(respObj)
    end
end

def descriptionExtractor(object)
    name = object["food_name"]
    description = object["food_description"]
    portion = description.split(/-/)[0].strip
    calories = description.split("-")[1].strip.split("|")[0].strip.split(":")[1].strip
    fat = description.split("-")[1].strip.split("|")[1].split(":")[1].strip
    carbs = description.split("-")[1].strip.split("|")[2].split(":")[1].strip
    protein = description.split("-")[1].strip.split("|")[3].split(":")[1].strip
    Food.create(name: name, calories:calories, fat:fat, carbs:carbs, protein:protein, portion: portion)
end

    def ultimateLooper(token)
        searchterms = ["chicken", "bread", "soup", "meat", "milk", "cheese", "cereal", "ham", "fish", "vegetables", "beef", "pork", "yogurt", 
        "fruit", "berries", "venison", "dessert", "breakfast", "lunch", "dinner", "cold", "goat", "tofu", "beans"]

        searchterms.each do |searchterm|
            url = URI("https://platform.fatsecret.com/rest/server.api?method=foods.search&search_expression=#{searchterm}&format=json")
            https = Net::HTTP.new(url.host, url.port);
            https.use_ssl = true
            request = Net::HTTP::Post.new(url)
            request["Content-Type"] = "application/js"
            request["Authorization"] = "Bearer #{token}"
            response = https.request(request)

            createFoods(response.read_body)
        end
    end

    ultimateLooper(token)
