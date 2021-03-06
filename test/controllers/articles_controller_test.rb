require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @account = accounts(:one)
    @article = articles(:one)
    @headers = {
      "Authorization": "Token token=#{@account.api_key}",
      "Accept": "application/json"
    }
    @params = {
      article: { amount_cents: @article.amount_cents, description: @article.description, name: @article.name }
    }
  end

  test "should get index" do
    get articles_url, as: :json, headers: @headers

    assert_response :success
  end

  test "should create article" do
    assert_difference('Article.count') do
      post articles_url, params: @params, headers: @headers
    end

    assert_response 201
  end

  test "should not create article" do
    @params[:article][:name] = nil

    post articles_url, params: @params, headers: @headers

    assert_response :unprocessable_entity
  end

  test "should show article" do
    get article_url(@article), headers: @headers
    assert_response :success
  end

  test "should update article" do
    patch article_url(@article), params: @params, headers: @headers

    assert_response 200
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete article_url(@article), headers: @headers
    end

    assert_response 204
  end
end
