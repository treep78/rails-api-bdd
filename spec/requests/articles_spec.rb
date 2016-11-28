require 'rails_helper'

RSpec.describe 'Articles API' do
  def article_params
    # parameters for creating an article
    {
      title: 'One Weird Trick',
      content: 'You won\'t believe what happens next...'
    }
  end

  def articles
    # returns a list of all articles
    Article.all
  end

  def article
    # returns the first article
    Article.first
  end

  before(:all) do
    # before each test, create an article
    # using the article params (above)
    Article.create!(article_params)
  end

  after(:all) do
    # delets the article after all tests have run
    Article.delete_all
  end

  # feature test
  # we're describing what happens when a get request is made to /articles
  describe 'GET /articles' do
    # we expect the get request to return a list of all the articles
    it 'lists all articles' do
      # get is a function that takes a string, and
      # makes a get request to that adress
      get '/articles'
      # expect to get a 20(0/x) response
      expect(response).to be_success

      # sets the vaiable 'articles_resposne' to
      # the body of the http response
      articles_response = JSON.parse(response.body)
      # expect the list of articles that we get from the server to
      # be the same length as the list of articles we created
      expect(articles_response.length).to eq(articles.count)
      expect(articles_response.first['title']).to eq(article['title'])
    end
  end

  describe 'GET /articles/:id' do
    skip 'shows one article' do
    end
  end

  describe 'DELETE /articles/:id' do
    skip 'deletes an article' do
    end
  end

  describe 'PATCH /articles/:id' do
    def article_diff
      { title: 'Two Stupid Tricks' }
    end

    skip 'updates an article' do
    end
  end

  describe 'POST /articles' do
    skip 'creates an article' do
    end
  end
end
