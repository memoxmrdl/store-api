require "test_helper"

class ArticlesVerifySchemasJsonTest < ActionDispatch::IntegrationTest
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

    assert_matches_json_schema response, "articles"
  end

  test "should create article" do
    @params[:article][:description] = "Another description"
    @params[:article][:name] = "Another name"

    assert_difference('Article.count') do
      post articles_url, params: @params, headers: @headers
    end

    assert_matches_json_schema response, "article"
  end

  test "should show article" do
    get article_url(@article), headers: @headers

    assert_matches_json_schema response, "article"
  end

  test "should update article" do
    patch article_url(@article), params: @params, headers: @headers

    assert_matches_json_schema response, "article"
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete article_url(@article), headers: @headers
    end

    assert_response 204
  end
end
