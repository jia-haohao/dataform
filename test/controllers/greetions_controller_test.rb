require "test_helper"

class GreetionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @greetion = greetions(:one)
  end

  test "should get index" do
    get greetions_url
    assert_response :success
  end

  test "should get new" do
    get new_greetion_url
    assert_response :success
  end

  test "should create greetion" do
    assert_difference('Greetion.count') do
      post greetions_url, params: { greetion: { message: @greetion.message, name: @greetion.name } }
    end

    assert_redirected_to greetion_url(Greetion.last)
  end

  test "should show greetion" do
    get greetion_url(@greetion)
    assert_response :success
  end

  test "should get edit" do
    get edit_greetion_url(@greetion)
    assert_response :success
  end

  test "should update greetion" do
    patch greetion_url(@greetion), params: { greetion: { message: @greetion.message, name: @greetion.name } }
    assert_redirected_to greetion_url(@greetion)
  end

  test "should destroy greetion" do
    assert_difference('Greetion.count', -1) do
      delete greetion_url(@greetion)
    end

    assert_redirected_to greetions_url
  end
end
