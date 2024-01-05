class NewsController < ApplicationController
    require 'httparty'
  
    def top_headlines
      endpoint = 'top-headlines'
      render_json(get_news_data(endpoint, news_params.to_h))
    end
  
    def all_articles
      endpoint = 'everything'
      render_json(get_news_data(endpoint, news_params.to_h))
    end
  
    def sources
      endpoint = 'sources'
      render_json(get_news_data(endpoint, news_params.to_h))
    end
  
    private
  
    def get_news_data(endpoint, options)
      api_key = '5e8b5846b1d34f76a41856f92007f7a1'
      base_url = 'https://newsapi.org/v2/'
  
      query_params = default_params.merge(options.merge(apiKey: api_key))
      url = "#{base_url}#{endpoint}"
      
      response = HTTParty.get(url, query: query_params)
      JSON.parse(response.body)
    end
  
    def default_params
      {
        q: 'bitcoin',
        language: 'en',
      }
    end
  
    def render_json(data)
      render json: data
    end
  
    def news_params
      params.permit(:q, :sources, :category, :language, :country, :domains, :from, :to, :sortBy, :page)
    end
end
  