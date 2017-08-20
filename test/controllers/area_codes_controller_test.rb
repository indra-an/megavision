require 'test_helper'

class AreaCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @area_code = area_codes(:one)
  end

  test "should get index" do
    get area_codes_url
    assert_response :success
  end

  test "should get new" do
    get new_area_code_url
    assert_response :success
  end

  test "should create area_code" do
    assert_difference('AreaCode.count') do
      post area_codes_url, params: { area_code: { code: @area_code.code } }
    end

    assert_redirected_to area_code_url(AreaCode.last)
  end

  test "should show area_code" do
    get area_code_url(@area_code)
    assert_response :success
  end

  test "should get edit" do
    get edit_area_code_url(@area_code)
    assert_response :success
  end

  test "should update area_code" do
    patch area_code_url(@area_code), params: { area_code: { code: @area_code.code } }
    assert_redirected_to area_code_url(@area_code)
  end

  test "should destroy area_code" do
    assert_difference('AreaCode.count', -1) do
      delete area_code_url(@area_code)
    end

    assert_redirected_to area_codes_url
  end
end
